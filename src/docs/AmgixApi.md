# amgix_client.AmgixApi

All URIs are relative to *http://localhost:8234*

Method | HTTP request | Description
------------- | ------------- | -------------
[**collection_exists**](AmgixApi.md#collection_exists) | **GET** /v1/collections/{collection_name}/exists | Collection Exists
[**create_collection**](AmgixApi.md#create_collection) | **POST** /v1/collections/{collection_name} | Create Collection
[**delete_collection**](AmgixApi.md#delete_collection) | **DELETE** /v1/collections/{collection_name} | Delete Collection
[**delete_collection_queue**](AmgixApi.md#delete_collection_queue) | **DELETE** /v1/collections/{collection_name}/queue | Delete Collection Queue
[**delete_document**](AmgixApi.md#delete_document) | **DELETE** /v1/collections/{collection_name}/documents/{document_id} | Delete Document
[**empty_collection**](AmgixApi.md#empty_collection) | **POST** /v1/collections/{collection_name}/empty | Empty Collection
[**get_collection_config**](AmgixApi.md#get_collection_config) | **GET** /v1/collections/{collection_name} | Get Collection Config
[**get_collection_queue_info**](AmgixApi.md#get_collection_queue_info) | **GET** /v1/collections/{collection_name}/queue/info | Get Collection Queue Info
[**get_document**](AmgixApi.md#get_document) | **GET** /v1/collections/{collection_name}/documents/{document_id} | Get Document
[**get_document_status**](AmgixApi.md#get_document_status) | **GET** /v1/collections/{collection_name}/documents/{document_id}/status | Get Document Status
[**health_check**](AmgixApi.md#health_check) | **GET** /v1/health/check | Health
[**health_ready**](AmgixApi.md#health_ready) | **GET** /v1/health/ready | Readiness Check
[**list_collections**](AmgixApi.md#list_collections) | **GET** /v1/collections | List Collections
[**search**](AmgixApi.md#search) | **POST** /v1/collections/{collection_name}/search | Search
[**upsert_document**](AmgixApi.md#upsert_document) | **POST** /v1/collections/{collection_name}/documents | Upsert Document
[**upsert_document_sync**](AmgixApi.md#upsert_document_sync) | **POST** /v1/collections/{collection_name}/documents/sync | Upsert Document Sync
[**upsert_documents_bulk**](AmgixApi.md#upsert_documents_bulk) | **POST** /v1/collections/{collection_name}/documents/bulk | Upsert Documents Bulk
[**version**](AmgixApi.md#version) | **GET** /v1/version | Version


# **collection_exists**
> CollectionExistsResponse collection_exists(collection_name)

Collection Exists

Check if a collection exists. Always returns 200 with exists true or false.

### Example


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

No authorization required

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

No authorization required

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

No authorization required

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

No authorization required

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
> OkResponse delete_document(collection_name, document_id)

Delete Document

Delete a document.

Deletes a specific document by its ID from the specified collection.

Args:
    collection_name: The name of the collection.
    document_id: The unique identifier of the document to delete.

Returns:
    An `OkResponse` object indicating the success of the operation.

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
    collection_name = 'collection_name_example' # str | Collection name (alphanumeric, underscores, hyphens only)
    document_id = 'document_id_example' # str | 

    try:
        # Delete Document
        api_response = await api_instance.delete_document(collection_name, document_id)
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

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
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

No authorization required

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

No authorization required

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
> Document get_document(collection_name, document_id)

Get Document

Retrieve a single document.

Retrieves a specific document by its ID from the specified collection.

Args:
    collection_name: The name of the collection.
    document_id: The unique identifier of the document to retrieve.

Returns:
    The retrieved `Document` object.

Raises:
    HTTPException: 404 if the document is not found in the collection.

### Example


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


# Enter a context with an instance of the API client
async with amgix_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = amgix_client.AmgixApi(api_client)
    collection_name = 'collection_name_example' # str | Collection name (alphanumeric, underscores, hyphens only)
    document_id = 'document_id_example' # str | 

    try:
        # Get Document
        api_response = await api_instance.get_document(collection_name, document_id)
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

### Return type

[**Document**](Document.md)

### Authorization

No authorization required

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

No authorization required

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

Runs four probes: database, rabbitmq, encoder (ping-encoder), rpc (ping-rpc).
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


```python
import amgix_client
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

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **search**
> List[SearchResult] search(collection_name, search_query)

Search

Perform a search query on a collection.

Executes a search query against the specified collection.

Args:
    collection_name: The name of the collection to search.
    query: The `SearchQuery` object containing the search text, filters, and other parameters.

Returns:
    A list of `SearchResult` objects, where each object represents a search result.

### Example


```python
import amgix_client
from amgix_client.models.search_query import SearchQuery
from amgix_client.models.search_result import SearchResult
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

[**List[SearchResult]**](SearchResult.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

### HTTP response details

| Status code | Description | Response headers |
|-------------|-------------|------------------|
**200** | Successful Response |  -  |
**422** | Validation Error |  -  |

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

No authorization required

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

No authorization required

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

No authorization required

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

