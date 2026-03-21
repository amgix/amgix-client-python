#!/usr/bin/env python3
"""Map semver-style prerelease tags (e.g. 1.0.0-beta3.2) to PEP 440 for setuptools."""

from __future__ import annotations

import re
import sys


def to_pep440(s: str) -> str:
    s = s.strip()
    if not s:
        raise ValueError("empty version")

    if re.fullmatch(r"\d+(?:\.\d+)*", s):
        return s

    if re.fullmatch(r"\d+(?:\.\d+)*([ab]\d+|rc\d+)(\.post\d+)?", s, re.I):
        return s

    m = re.fullmatch(r"(\d+(?:\.\d+)*)-beta(\d+)(?:\.(\d+))?", s, re.I)
    if m:
        base, n, sub = m.group(1), m.group(2), m.group(3)
        out = f"{base}b{n}"
        if sub is not None:
            out += f".post{sub}"
        return out

    m = re.fullmatch(r"(\d+(?:\.\d+)*)-alpha(\d+)(?:\.(\d+))?", s, re.I)
    if m:
        base, n, sub = m.group(1), m.group(2), m.group(3)
        out = f"{base}a{n}"
        if sub is not None:
            out += f".post{sub}"
        return out

    m = re.fullmatch(r"(\d+(?:\.\d+)*)-rc(\d+)(?:\.(\d+))?", s, re.I)
    if m:
        base, n, sub = m.group(1), m.group(2), m.group(3)
        out = f"{base}rc{n}"
        if sub is not None:
            out += f".post{sub}"
        return out

    m = re.fullmatch(r"(\d+(?:\.\d+)*)-preview(\d+)(?:\.(\d+))?", s, re.I)
    if m:
        base, n, sub = m.group(1), m.group(2), m.group(3)
        out = f"{base}a{n}"
        if sub is not None:
            out += f".post{sub}"
        return out

    raise ValueError(f"unsupported version format: {s!r}")


def main() -> None:
    if len(sys.argv) != 2:
        print("usage: to_pep440.py <version>", file=sys.stderr)
        sys.exit(2)
    try:
        out = to_pep440(sys.argv[1])
    except ValueError as e:
        print(e, file=sys.stderr)
        sys.exit(1)
    try:
        from packaging.version import InvalidVersion, Version

        try:
            Version(out)
        except InvalidVersion as e:
            print(f"PEP 440 check failed for {out!r}: {e}", file=sys.stderr)
            sys.exit(1)
    except ImportError:
        pass
    print(out)


if __name__ == "__main__":
    main()
