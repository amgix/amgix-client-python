#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"

usage() {
  echo "Usage: $0 <server-version> [package-version]" >&2
  echo "  server-version: Docker image tag without -noembed (e.g. v1.0.0 or v1.0.0-beta2.45)" >&2
  echo "  package-version: optional; client packageVersion (default: same as server without leading v)" >&2
  exit 1
}

if [[ $# -lt 1 ]] || [[ $# -gt 2 ]]; then
  usage
fi

VERSION="$1"
PACKAGE_VERSION_INPUT="${2:-}"

if [[ -z "${VERSION// }" ]]; then
  echo "error: server-version is empty" >&2
  exit 1
fi
if [[ ! "$VERSION" =~ ^v[0-9]+(\.[0-9]+)*(-[a-zA-Z0-9][a-zA-Z0-9.]*)?$ ]]; then
  echo "error: invalid server-version (got: $VERSION). Use v plus semver, e.g. v1.0.0 or v1.0.0-beta2.45" >&2
  exit 1
fi

if [[ -n "$PACKAGE_VERSION_INPUT" ]]; then
  PV="$PACKAGE_VERSION_INPUT"
  PV="${PV#v}"
  if [[ -z "${PV// }" ]]; then
    echo "error: package-version is empty" >&2
    exit 1
  fi
  if [[ ! "$PV" =~ ^[0-9]+(\.[0-9]+)*(-[a-zA-Z0-9][a-zA-Z0-9.]*)?$ ]]; then
    echo "error: invalid package-version (got: $PACKAGE_VERSION_INPUT)" >&2
    exit 1
  fi
  PACKAGE_VERSION="$PV"
else
  PACKAGE_VERSION="${VERSION#v}"
fi

OPENAPI_31_TMP="$(mktemp "${TMPDIR:-/tmp}/amgix-openapi-31.XXXXXX.json")"
OPENAPI_30_LOCAL="${ROOT}/openapi-30.local.json"

CONTAINER_NAME="amgix-one-gen-$$"
cleanup() {
  docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true
  rm -f "${OPENAPI_31_TMP:-}" "${OPENAPI_30_LOCAL:-}"
}
trap cleanup EXIT

echo "Starting amgixio/amgix-one:${VERSION}-noembed ..."
docker run -d --name "$CONTAINER_NAME" -p 8234:8234 "amgixio/amgix-one:${VERSION}-noembed"

echo "Waiting for API (up to 120s) ..."
sleep 3
timeout 120 bash -c '
  while true; do
    CODE=$(curl -sS -o /tmp/amgix-ready.json -w "%{http_code}" http://localhost:8234/v1/health/ready 2>/dev/null) || CODE=000
    if [ "$CODE" = "200" ]; then break; fi
    echo "  ... (HTTP ${CODE})"
    sleep 5
  done
'
echo "API ready"

echo "Fetching OpenAPI spec ..."
curl -fsS -o "$OPENAPI_31_TMP" http://localhost:8234/openapi.json

echo "Downgrading spec (OpenAPI 3.1 → 3.0-compatible) ..."
python3 "$ROOT/openapi-downgrade.py" "$OPENAPI_31_TMP" -o "$OPENAPI_30_LOCAL" -f json
rm -f "$OPENAPI_31_TMP"
OPENAPI_31_TMP=""
if [[ ! -s "$OPENAPI_30_LOCAL" ]]; then
  echo "error: downgrade produced empty or missing output" >&2
  exit 1
fi

echo "Server image: amgixio/amgix-one:${VERSION}-noembed"
echo "Package version: ${PACKAGE_VERSION}"
echo "Setting client.yaml packageVersion to ${PACKAGE_VERSION} ..."
sed -i.bak "s/^  packageVersion: .*/  packageVersion: ${PACKAGE_VERSION}/" client.yaml
rm -f client.yaml.bak

echo "Generating Python client ..."
# Generator runs in a container; localhost there is not the host. host.docker.internal
# reaches the host (amgix-one on 8234). Linux needs explicit host mapping.
docker run --rm \
  --add-host=host.docker.internal:host-gateway \
  -v "$ROOT":/local \
  -w /local \
  openapitools/openapi-generator-cli:latest \
  generate -c client.yaml --skip-validate-spec

cleanup
trap - EXIT

echo "Done. Review changes under src/, and commit if correct."
