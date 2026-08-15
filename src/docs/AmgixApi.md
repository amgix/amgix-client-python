# amgix_client.AmgixApi

All URIs are relative to *http://localhost:8234*

Method | HTTP request | Description
------------- | ------------- | -------------
[**collection_exists**](AmgixApi.md#collection_exists) | **GET** /v1/collections/{collection_name}/exists | Collection Exists
[**create_collection**](AmgixApi.md#create_collection) | **POST** /v1/collections/{collection_name} | Create Collection
[**delete_collection**](AmgixApi.md#delete_collection) | **DELETE** /v1/collections/{collection_name} | Delete Collection
[**delete_collection_queue**](AmgixApi.md#delete_collection_queue) | **DELETE** /v1/collections/{collection_name}/queue | Delete Collection Queue
[**delete_document**](AmgixApi.md#delete_document) | **DELETE** /v1/collections/{collection_name}/documents/{document_id} | Delete Document
[**delete_document_sync**](AmgixApi.md#delete_document_sync) | **DELETE** /v1/collections/{collection_name}/documents/{document_id}/sync | Delete Document Sync
[**empty_collection**](AmgixApi.md#empty_collection) | **POST** /v1/collections/{collection_name}/empty | Empty Collection
[**export_documents**](AmgixApi.md#export_documents) | **GET** /v1/collections/{collection_name}/documents/export | Export Documents
[**fetch_documents**](AmgixApi.md#fetch_documents) | **POST** /v1/collections/{collection_name}/documents/fetch | Fetch Documents
[**get_collection_config**](AmgixApi.md#get_collection_config) | **GET** /v1/collections/{collection_name} | Get Collection Config
[**get_collection_queue_info**](AmgixApi.md#get_collection_queue_info) | **GET** /v1/collections/{collection_name}/queue/info | Get Collection Queue Info
[**get_collection_stats**](AmgixApi.md#get_collection_stats) | **GET** /v1/collections/{collection_name}/stats | Get Collection Stats
[**get_document**](AmgixApi.md#get_document) | **GET** /v1/collections/{collection_name}/documents/{document_id} | Get Document
[**get_document_status**](AmgixApi.md#get_document_status) | **GET** /v1/collections/{collection_name}/documents/{document_id}/status | Get Document Status
[**health_check**](AmgixApi.md#health_check) | **GET** /v1/health/check | Health
[**health_ready**](AmgixApi.md#health_ready) | **GET** /v1/health/ready | Readiness Check
[**list_collections**](AmgixApi.md#list_collections) | **GET** /v1/collections | List Collections
[**metrics_current**](AmgixApi.md#metrics_current) | **GET** /v1/metrics/current | Metrics Current
[**metrics_definitions**](AmgixApi.md#metrics_definitions) | **GET** /v1/metrics/definitions | Metrics Definitions
[**metrics_prometheus**](AmgixApi.md#metrics_prometheus) | **GET** /v1/metrics/prometheus | Metrics Prometheus
[**metrics_trends**](AmgixApi.md#metrics_trends) | **GET** /v1/metrics/trends | Metrics Trends
[**search**](AmgixApi.md#search) | **POST** /v1/collections/{collection_name}/search | Search
[**system_info**](AmgixApi.md#system_info) | **GET** /v1/system/info | System Info
[**upsert_document**](AmgixApi.md#upsert_document) | **POST** /v1/collections/{collection_name}/documents | Upsert Document
[**upsert_document_sync**](AmgixApi.md#upsert_document_sync) | **POST** /v1/collections/{collection_name}/documents/sync | Upsert Document Sync
[**upsert_documents_bulk**](AmgixApi.md#upsert_documents_bulk) | **POST** /v1/collections/{collection_name}/documents/bulk | Upsert Documents Bulk
[**version**](AmgixApi.md#version) | **GET** /v1/version | Version


# **collection_exists**
> CollectionExistsResponse collection_exists(collection_name)

Collection Exists

Check if a collection exists. Always returns 200 with exists true or false.

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.models.collection_exists_response import CollectionExistsResponse
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)
    collection_name = 'collection_name_example' # str | Collection name (alphanumeric, underscores, hyphens only)

    try:
        # Collection Exists
        api_response = await api_instance.collection_exists(collection_name)
        print("The response of AmgixApi->collection_exists:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->collection_exists: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection_name** | **str**| Collection name (alphanumeric, underscores, hyphens only) | 

### Return type

[**CollectionExistsResponse**](CollectionExistsResponse.md)

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |
**422** | Validation Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **create_collection**
> OkResponse create_collection(collection_name, collection_config)

Create Collection

Create a new collection.

This endpoint creates a new collection with the specified name and vector configurations.
It validates the provided model configurations and ensures all required features are supported by the database.

Args:
    collection_name: The unique name for the new collection (alphanumeric, underscores, hyphens only).
    config: Configuration details for the collection, including vector types and storage options.

Returns:
    An `OkResponse` object indicating the success of the operation.

Raises:
    HTTPException:
        - 400 if model validation fails or required features are not supported.
        - 409 if a collection with the same name already exists.
        - 500 if the collection creation fails in the database.

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.models.collection_config import CollectionConfig
from amgix_client.models.ok_response import OkResponse
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)
    collection_name = 'collection_name_example' # str | Collection name (alphanumeric, underscores, hyphens only)
    collection_config = amgix_client.CollectionConfig() # CollectionConfig | 

    try:
        # Create Collection
        api_response = await api_instance.create_collection(collection_name, collection_config)
        print("The response of AmgixApi->create_collection:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->create_collection: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection_name** | **str**| Collection name (alphanumeric, underscores, hyphens only) | 
 **collection_config** | [**CollectionConfig**](CollectionConfig.md)|  | 

### Return type

[**OkResponse**](OkResponse.md)

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |
**422** | Validation Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_collection**
> OkResponse delete_collection(collection_name)

Delete Collection

Delete a collection.

Deletes a collection and all its associated data. This operation is irreversible.

Args:
    collection_name: The name of the collection to delete.

Returns:
    An `OkResponse` object indicating the success of the operation.

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.models.ok_response import OkResponse
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)
    collection_name = 'collection_name_example' # str | Collection name (alphanumeric, underscores, hyphens only)

    try:
        # Delete Collection
        api_response = await api_instance.delete_collection(collection_name)
        print("The response of AmgixApi->delete_collection:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->delete_collection: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection_name** | **str**| Collection name (alphanumeric, underscores, hyphens only) | 

### Return type

[**OkResponse**](OkResponse.md)

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |
**422** | Validation Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_collection_queue**
> OkResponse delete_collection_queue(collection_name)

Delete Collection Queue

Delete all queue entries for a collection.

Removes all documents from the processing queue for a specified collection.
This does not affect documents already indexed in the collection.

Args:
    collection_name: The name of the collection for which to delete queue entries.

Returns:
    An `OkResponse` object indicating the success of the operation.

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.models.ok_response import OkResponse
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)
    collection_name = 'collection_name_example' # str | Collection name (alphanumeric, underscores, hyphens only)

    try:
        # Delete Collection Queue
        api_response = await api_instance.delete_collection_queue(collection_name)
        print("The response of AmgixApi->delete_collection_queue:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->delete_collection_queue: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection_name** | **str**| Collection name (alphanumeric, underscores, hyphens only) | 

### Return type

[**OkResponse**](OkResponse.md)

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |
**422** | Validation Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_document**
> OkResponse delete_document(collection_name, document_id, request_timestamp)

Delete Document

Delete a document asynchronously.

Queues a document for deletion and returns immediately. The document will be deleted asynchronously.

Args:
    collection_name: The name of the collection.
    document_id: The unique identifier of the document to delete.

Returns:
    An `OkResponse` object indicating the success of the operation.

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.models.ok_response import OkResponse
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)
    collection_name = 'collection_name_example' # str | Collection name (alphanumeric, underscores, hyphens only)
    document_id = 'document_id_example' # str | 
    request_timestamp = '2013-10-20T19:20:30+01:00' # datetime | Caller-supplied delete timestamp (UTC)

    try:
        # Delete Document
        api_response = await api_instance.delete_document(collection_name, document_id, request_timestamp)
        print("The response of AmgixApi->delete_document:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->delete_document: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection_name** | **str**| Collection name (alphanumeric, underscores, hyphens only) | 
 **document_id** | **str**|  | 
 **request_timestamp** | **datetime**| Caller-supplied delete timestamp (UTC) | 

### Return type

[**OkResponse**](OkResponse.md)

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |
**422** | Validation Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delete_document_sync**
> OkResponse delete_document_sync(collection_name, document_id, request_timestamp)

Delete Document Sync

Delete a document synchronously.

Deletes a specific document by its ID from the specified collection and waits for the operation to complete.

Args:
    collection_name: The name of the collection.
    document_id: The unique identifier of the document to delete.

Returns:
    An `OkResponse` object indicating the success of the operation.

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.models.ok_response import OkResponse
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)
    collection_name = 'collection_name_example' # str | Collection name (alphanumeric, underscores, hyphens only)
    document_id = 'document_id_example' # str | 
    request_timestamp = '2013-10-20T19:20:30+01:00' # datetime | Caller-supplied delete timestamp (UTC)

    try:
        # Delete Document Sync
        api_response = await api_instance.delete_document_sync(collection_name, document_id, request_timestamp)
        print("The response of AmgixApi->delete_document_sync:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->delete_document_sync: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection_name** | **str**| Collection name (alphanumeric, underscores, hyphens only) | 
 **document_id** | **str**|  | 
 **request_timestamp** | **datetime**| Caller-supplied delete timestamp (UTC) | 

### Return type

[**OkResponse**](OkResponse.md)

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |
**422** | Validation Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **empty_collection**
> OkResponse empty_collection(collection_name)

Empty Collection

Empty a collection.

Removes all documents and their associated vector data from a specified collection,
but keeps the collection's configuration.

Args:
    collection_name: The name of the collection to empty.

Returns:
    An `OkResponse` object indicating the success of the operation.

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.models.ok_response import OkResponse
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)
    collection_name = 'collection_name_example' # str | Collection name (alphanumeric, underscores, hyphens only)

    try:
        # Empty Collection
        api_response = await api_instance.empty_collection(collection_name)
        print("The response of AmgixApi->empty_collection:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->empty_collection: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection_name** | **str**| Collection name (alphanumeric, underscores, hyphens only) | 

### Return type

[**OkResponse**](OkResponse.md)

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |
**422** | Validation Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **export_documents**
> bytes export_documents(collection_name, with_vectors=with_vectors)

Export Documents

Export all documents in a collection as a downloadable gzip-compressed JSON array.

Streams ``[{...},{...},...]`` without loading the full collection into memory.

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)
    collection_name = 'collection_name_example' # str | Collection name (alphanumeric, underscores, hyphens only)
    with_vectors = False # bool | When true, include stored vector values on each exported document. (optional) (default to False)

    try:
        # Export Documents
        api_response = await api_instance.export_documents(collection_name, with_vectors=with_vectors)
        print("The response of AmgixApi->export_documents:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->export_documents: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection_name** | **str**| Collection name (alphanumeric, underscores, hyphens only) | 
 **with_vectors** | **bool**| When true, include stored vector values on each exported document. | [optional] [default to False]

### Return type

**bytes**

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/gzip, application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Gzip-compressed UTF-8 JSON file. After gunzip, the payload is a JSON array of Document objects (Document[]). Suggested filename is in Content-Disposition. |  * Content-Disposition - attachment; filename&#x3D;\&quot;{collection_name}-{timestamp}.json.gz\&quot; <br>  |
**404** | Collection not found |  -  |
**422** | Validation Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **fetch_documents**
> DocumentFetchResponse fetch_documents(collection_name, document_fetch_request)

Fetch Documents

Fetch a page of documents from a collection.

Returns documents in stable internal order with cursor-based pagination.
Pass the returned `after` token in the next request to get the following page.
`after` is null when there are no more documents.

Args:
    collection_name: The name of the collection.
    body: Pagination and filter parameters.

Returns:
    A `DocumentFetchResponse` with a page of documents and a pagination token.

Raises:
    HTTPException: 404 if the collection does not exist.
    HTTPException: 400 if a filter references an unindexed metadata key.

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.models.document_fetch_request import DocumentFetchRequest
from amgix_client.models.document_fetch_response import DocumentFetchResponse
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)
    collection_name = 'collection_name_example' # str | Collection name (alphanumeric, underscores, hyphens only)
    document_fetch_request = amgix_client.DocumentFetchRequest() # DocumentFetchRequest | 

    try:
        # Fetch Documents
        api_response = await api_instance.fetch_documents(collection_name, document_fetch_request)
        print("The response of AmgixApi->fetch_documents:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->fetch_documents: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection_name** | **str**| Collection name (alphanumeric, underscores, hyphens only) | 
 **document_fetch_request** | [**DocumentFetchRequest**](DocumentFetchRequest.md)|  | 

### Return type

[**DocumentFetchResponse**](DocumentFetchResponse.md)

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |
**422** | Validation Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_collection_config**
> CollectionConfig get_collection_config(collection_name)

Get Collection Config

Get collection configuration.

Retrieves the configuration details for a specific collection.

Args:
    collection_name: The name of the collection.

Returns:
    The configuration of the specified collection.

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.models.collection_config import CollectionConfig
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)
    collection_name = 'collection_name_example' # str | Collection name (alphanumeric, underscores, hyphens only)

    try:
        # Get Collection Config
        api_response = await api_instance.get_collection_config(collection_name)
        print("The response of AmgixApi->get_collection_config:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->get_collection_config: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection_name** | **str**| Collection name (alphanumeric, underscores, hyphens only) | 

### Return type

[**CollectionConfig**](CollectionConfig.md)

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |
**422** | Validation Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_collection_queue_info**
> QueueInfo get_collection_queue_info(collection_name)

Get Collection Queue Info

Get queue statistics for a collection.

Retrieves counts of documents in different queue states (queued, requeued, failed).

Args:
    collection_name: The name of the collection.

Returns:
    A `QueueInfo` object with counts for each queue state.

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.models.queue_info import QueueInfo
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)
    collection_name = 'collection_name_example' # str | Collection name (alphanumeric, underscores, hyphens only)

    try:
        # Get Collection Queue Info
        api_response = await api_instance.get_collection_queue_info(collection_name)
        print("The response of AmgixApi->get_collection_queue_info:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->get_collection_queue_info: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection_name** | **str**| Collection name (alphanumeric, underscores, hyphens only) | 

### Return type

[**QueueInfo**](QueueInfo.md)

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |
**422** | Validation Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_collection_stats**
> CollectionStatsResponse get_collection_stats(collection_name)

Get Collection Stats

Get persisted collection statistics and queue counts.

Returns document counts maintained by the indexing pipeline (not a live physical count),
plus queue entry counts by state (same data as ``GET .../queue/info``).

Args:
    collection_name: The name of the collection.

Returns:
    A `CollectionStatsResponse` with `doc_count` and `queue`.

Raises:
    HTTPException: 404 if the collection does not exist.

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.models.collection_stats_response import CollectionStatsResponse
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)
    collection_name = 'collection_name_example' # str | Collection name (alphanumeric, underscores, hyphens only)

    try:
        # Get Collection Stats
        api_response = await api_instance.get_collection_stats(collection_name)
        print("The response of AmgixApi->get_collection_stats:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->get_collection_stats: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection_name** | **str**| Collection name (alphanumeric, underscores, hyphens only) | 

### Return type

[**CollectionStatsResponse**](CollectionStatsResponse.md)

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |
**422** | Validation Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_document**
> Document get_document(collection_name, document_id, with_vectors=with_vectors)

Get Document

Retrieve a single document.

Retrieves a specific document by its ID from the specified collection.

Args:
    collection_name: The name of the collection.
    document_id: The unique identifier of the document to retrieve.
    with_vectors: When true, include stored vector values on the document.

Returns:
    The retrieved `Document` object.

Raises:
    HTTPException: 404 if the document is not found in the collection.

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.models.document import Document
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)
    collection_name = 'collection_name_example' # str | Collection name (alphanumeric, underscores, hyphens only)
    document_id = 'document_id_example' # str | 
    with_vectors = False # bool | When true, include stored vector values on the document. (optional) (default to False)

    try:
        # Get Document
        api_response = await api_instance.get_document(collection_name, document_id, with_vectors=with_vectors)
        print("The response of AmgixApi->get_document:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->get_document: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection_name** | **str**| Collection name (alphanumeric, underscores, hyphens only) | 
 **document_id** | **str**|  | 
 **with_vectors** | **bool**| When true, include stored vector values on the document. | [optional] [default to False]

### Return type

[**Document**](Document.md)

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |
**422** | Validation Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **get_document_status**
> DocumentStatusResponse get_document_status(collection_name, document_id)

Get Document Status

Get document processing status.

Retrieves the processing status of a document, including its current state in the queue
and any associated messages.

Args:
    collection_name: The name of the collection.
    document_id: The unique identifier of the document.

Returns:
    A `DocumentStatusResponse` object containing the processing status of the document.

Raises:
    HTTPException: 404 if the document is not found in the collection's queue.

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.models.document_status_response import DocumentStatusResponse
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)
    collection_name = 'collection_name_example' # str | Collection name (alphanumeric, underscores, hyphens only)
    document_id = 'document_id_example' # str | 

    try:
        # Get Document Status
        api_response = await api_instance.get_document_status(collection_name, document_id)
        print("The response of AmgixApi->get_document_status:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->get_document_status: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection_name** | **str**| Collection name (alphanumeric, underscores, hyphens only) | 
 **document_id** | **str**|  | 

### Return type

[**DocumentStatusResponse**](DocumentStatusResponse.md)

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |
**422** | Validation Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **health_check**
> OkResponse health_check()

Health

Check API service responsiveness.

This endpoint returns a simple 'ok' status to indicate that the API service
is running and able to respond to requests.

Returns:
    An `OkResponse` object with the 'ok' field set to True, confirming the service's responsiveness.

### Example


```python
import amgix_client
from amgix_client.models.ok_response import OkResponse
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)


# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)

    try:
        # Health
        api_response = await api_instance.health_check()
        print("The response of AmgixApi->health_check:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->health_check: %s\n" % e)
```



### Parameters

This endpoint does not need any parameter.

### Return type

[**OkResponse**](OkResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **health_ready**
> ReadyResponse health_ready()

Readiness Check

Check if service is ready to handle requests.

Runs four probes: database, rabbitmq, index workers, query workers.
Returns 200 if all pass (fully ready), 218 if some fail (partial ready).
Response body always includes all four probe results and a ready flag.

### Example


```python
import amgix_client
from amgix_client.models.ready_response import ReadyResponse
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)


# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)

    try:
        # Readiness Check
        api_response = await api_instance.health_ready()
        print("The response of AmgixApi->health_ready:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->health_ready: %s\n" % e)
```



### Parameters

This endpoint does not need any parameter.

### Return type

[**ReadyResponse**](ReadyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Fully ready |  -  |
**218** | Partial ready (some index/query probes not ready) |  -  |
**503** | Service Unavailable (infra down or all encoder roles down) |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **list_collections**
> List[str] list_collections()

List Collections

List all available collections.

Retrieves a list of all collections managed by the application.

Returns:
    A list of strings, where each string is the name of an available collection.

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)

    try:
        # List Collections
        api_response = await api_instance.list_collections()
        print("The response of AmgixApi->list_collections:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->list_collections: %s\n" % e)
```



### Parameters

This endpoint does not need any parameter.

### Return type

**List[str]**

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **metrics_current**
> Metrics metrics_current(window=window, keys=keys)

Metrics Current

Return the current metrics state for all nodes over the given window (seconds).

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.models.metrics import Metrics
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)
    window = 60 # int | Aggregation window in seconds - 30 or 60. (optional) (default to 60)
    keys = ['keys_example'] # List[str] | Restrict returned metric series to these keys. Omit for all keys. (optional)

    try:
        # Metrics Current
        api_response = await api_instance.metrics_current(window=window, keys=keys)
        print("The response of AmgixApi->metrics_current:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->metrics_current: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **window** | **int**| Aggregation window in seconds - 30 or 60. | [optional] [default to 60]
 **keys** | [**List[str]**](str.md)| Restrict returned metric series to these keys. Omit for all keys. | [optional] 

### Return type

[**Metrics**](Metrics.md)

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |
**422** | Validation Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **metrics_definitions**
> List[MetricDefinitionItem] metrics_definitions()

Metrics Definitions

Return catalog entries for all known metric keys, their units, and descriptions.

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.models.metric_definition_item import MetricDefinitionItem
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)

    try:
        # Metrics Definitions
        api_response = await api_instance.metrics_definitions()
        print("The response of AmgixApi->metrics_definitions:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->metrics_definitions: %s\n" % e)
```



### Parameters

This endpoint does not need any parameter.

### Return type

[**List[MetricDefinitionItem]**](MetricDefinitionItem.md)

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **metrics_prometheus**
> str metrics_prometheus()

Metrics Prometheus

Expose current cluster metrics in Prometheus text exposition (60s rolling window).

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)

    try:
        # Metrics Prometheus
        api_response = await api_instance.metrics_prometheus()
        print("The response of AmgixApi->metrics_prometheus:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->metrics_prometheus: %s\n" % e)
```



### Parameters

This endpoint does not need any parameter.

### Return type

**str**

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **metrics_trends**
> List[MetricTrend] metrics_trends(since, until, resolution=resolution, keys=keys)

Metrics Trends

Return historical metric buckets for the given time range and resolution.

Args:
    since: Inclusive start of the time range (ISO 8601, UTC assumed if no timezone given).
    until: Exclusive end of the time range (ISO 8601, UTC assumed if no timezone given).
    resolution: Bucket size in seconds - 60 for 1-minute, 300 for 5-minute.
    keys: One or more metric keys to return. Omit to return all keys.

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.models.metric_trend import MetricTrend
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)
    since = '2013-10-20T19:20:30+01:00' # datetime | Inclusive start of the time range (ISO 8601)
    until = '2013-10-20T19:20:30+01:00' # datetime | Exclusive end of the time range (ISO 8601)
    resolution = 60 # int | Bucket size in seconds - 60 for 1-minute, 300 for 5-minute. (optional) (default to 60)
    keys = ['keys_example'] # List[str] |  (optional)

    try:
        # Metrics Trends
        api_response = await api_instance.metrics_trends(since, until, resolution=resolution, keys=keys)
        print("The response of AmgixApi->metrics_trends:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->metrics_trends: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **since** | **datetime**| Inclusive start of the time range (ISO 8601) | 
 **until** | **datetime**| Exclusive end of the time range (ISO 8601) | 
 **resolution** | **int**| Bucket size in seconds - 60 for 1-minute, 300 for 5-minute. | [optional] [default to 60]
 **keys** | [**List[str]**](str.md)|  | [optional] 

### Return type

[**List[MetricTrend]**](MetricTrend.md)

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |
**422** | Validation Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search**
> SearchResponse search(collection_name, search_query)

Search

Perform a search query on a collection.

Executes a search query against the specified collection.

Args:
    collection_name: The name of the collection to search.
    query: The `SearchQuery` object containing the search text, filters, and other parameters.

Returns:
    A `SearchResponse` with search hits and server-side query timing.

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.models.search_query import SearchQuery
from amgix_client.models.search_response import SearchResponse
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)
    collection_name = 'collection_name_example' # str | Collection name (alphanumeric, underscores, hyphens only)
    search_query = amgix_client.SearchQuery() # SearchQuery | 

    try:
        # Search
        api_response = await api_instance.search(collection_name, search_query)
        print("The response of AmgixApi->search:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->search: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection_name** | **str**| Collection name (alphanumeric, underscores, hyphens only) | 
 **search_query** | [**SearchQuery**](SearchQuery.md)|  | 

### Return type

[**SearchResponse**](SearchResponse.md)

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |
**422** | Validation Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **system_info**
> SystemInfoResponse system_info()

System Info

Summarize deployment and infrastructure (no connection URLs).

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.models.system_info_response import SystemInfoResponse
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)

    try:
        # System Info
        api_response = await api_instance.system_info()
        print("The response of AmgixApi->system_info:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->system_info: %s\n" % e)
```



### Parameters

This endpoint does not need any parameter.

### Return type

[**SystemInfoResponse**](SystemInfoResponse.md)

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **upsert_document**
> OkResponse upsert_document(collection_name, document)

Upsert Document

Upsert a single document asynchronously.

Adds or updates a single document in the specified collection by placing it into a processing queue.
The document will be vectorized and indexed asynchronously.

Args:
    collection_name: The name of the collection to upsert the document into.
    document: The document object to be upserted.

Returns:
    An `OkResponse` object indicating that the document has been accepted for processing.

Raises:
    HTTPException: 500 if publishing the event to the internal queue fails.

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.models.document import Document
from amgix_client.models.ok_response import OkResponse
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)
    collection_name = 'collection_name_example' # str | Collection name (alphanumeric, underscores, hyphens only)
    document = amgix_client.Document() # Document | 

    try:
        # Upsert Document
        api_response = await api_instance.upsert_document(collection_name, document)
        print("The response of AmgixApi->upsert_document:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->upsert_document: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection_name** | **str**| Collection name (alphanumeric, underscores, hyphens only) | 
 **document** | [**Document**](Document.md)|  | 

### Return type

[**OkResponse**](OkResponse.md)

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |
**422** | Validation Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **upsert_document_sync**
> OkResponse upsert_document_sync(collection_name, document)

Upsert Document Sync

Upsert a single document synchronously.

Adds or updates a single document in the specified collection and waits for the operation
to complete, including vectorization and indexing.

Args:
    collection_name: The name of the collection to upsert the document into.
    document: The document object to be upserted.

Returns:
    An `OkResponse` object indicating the success of the operation.

Raises:
    HTTPException:
        - 409 if a document with the same ID and newer timestamp already exists (conflict).
        - 500 for other internal server errors during processing.

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.models.document import Document
from amgix_client.models.ok_response import OkResponse
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)
    collection_name = 'collection_name_example' # str | Collection name (alphanumeric, underscores, hyphens only)
    document = amgix_client.Document() # Document | 

    try:
        # Upsert Document Sync
        api_response = await api_instance.upsert_document_sync(collection_name, document)
        print("The response of AmgixApi->upsert_document_sync:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->upsert_document_sync: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection_name** | **str**| Collection name (alphanumeric, underscores, hyphens only) | 
 **document** | [**Document**](Document.md)|  | 

### Return type

[**OkResponse**](OkResponse.md)

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |
**422** | Validation Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **upsert_documents_bulk**
> OkResponse upsert_documents_bulk(collection_name, bulk_upload_request)

Upsert Documents Bulk

Upsert multiple documents in bulk asynchronously.

Adds or updates multiple documents in the specified collection by placing them into a processing queue.
Documents will be vectorized and indexed asynchronously. This method is optimized for bulk operations.

Args:
    collection_name: The name of the collection to upsert the documents into.
    request: A `BulkUploadRequest` object containing a list of `Document` objects to be upserted.

Returns:
    An `OkResponse` object indicating that the documents have been accepted for processing.

Raises:
    HTTPException: 500 if publishing events to the internal queue fails for any document.

### Example

* Api Key Authentication (ApiKeyHeader):
* Bearer Authentication (BearerAuth):

```python
import amgix_client
from amgix_client.models.bulk_upload_request import BulkUploadRequest
from amgix_client.models.ok_response import OkResponse
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)

# The client must configure the authentication and authorization parameters
# in accordance with the API server security policy.
# Examples for each auth method are provided below, use the example that
# satisfies your auth use case.

# Configure API key authorization: ApiKeyHeader
configuration.api_key['ApiKeyHeader'] = os.environ["API_KEY"]

# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['ApiKeyHeader'] = 'Bearer'

# Configure Bearer authorization: BearerAuth
configuration = amgix_client.Configuration(
    access_token = os.environ["BEARER_TOKEN"]
)

# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)
    collection_name = 'collection_name_example' # str | Collection name (alphanumeric, underscores, hyphens only)
    bulk_upload_request = amgix_client.BulkUploadRequest() # BulkUploadRequest | 

    try:
        # Upsert Documents Bulk
        api_response = await api_instance.upsert_documents_bulk(collection_name, bulk_upload_request)
        print("The response of AmgixApi->upsert_documents_bulk:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->upsert_documents_bulk: %s\n" % e)
```



### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **collection_name** | **str**| Collection name (alphanumeric, underscores, hyphens only) | 
 **bulk_upload_request** | [**BulkUploadRequest**](BulkUploadRequest.md)|  | 

### Return type

[**OkResponse**](OkResponse.md)

### Authorization

[ApiKeyHeader](../README.md#ApiKeyHeader), [BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |
**422** | Validation Error |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **version**
> VersionResponse version()

Version

Return the system version.

Returns:
    A `VersionResponse` object with the system version.

### Example


```python
import amgix_client
from amgix_client.models.version_response import VersionResponse
from amgix_client.rest import ApiException
from pprint import pprint

# Defining the host is optional and defaults to http://localhost:8234
# See configuration.py for a list of all supported configuration parameters.
configuration = amgix_client.Configuration(
    host = "http://localhost:8234"
)


# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)

    try:
        # Version
        api_response = await api_instance.version()
        print("The response of AmgixApi->version:\n")
        pprint(api_response)
    except Exception as e:
        print("Exception when calling AmgixApi->version: %s\n" % e)
```



### Parameters

This endpoint does not need any parameter.

### Return type

[**VersionResponse**](VersionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

