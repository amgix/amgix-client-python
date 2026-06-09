# DocumentFetchRequest

Request body for paginated document fetching.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**page_size** | **int** | Number of documents per page (1 to 1000) | [optional] [default to 100]
**after** | **str** | Pagination token returned by a previous fetch call. Omit or set to null to start from the beginning. | [optional] 
**metadata_filter** | [**MetadataFilter**](MetadataFilter.md) |  | [optional] 
**document_tags** | **List[str]** | Optional filter to include only documents with specific tags (max 50 tags). | [optional] 
**document_tags_match_all** | **bool** | If True, documents must have ALL specified tags (AND). If False, ANY (OR). | [optional] [default to False]

## Example

```python
from amgix_client.models.document_fetch_request import DocumentFetchRequest

# TODO update the JSON string below
json = "{}"
# create an instance of DocumentFetchRequest from a JSON string
document_fetch_request_instance = DocumentFetchRequest.from_json(json)
# print the JSON string representation of the object
print(DocumentFetchRequest.to_json())

# convert the object into a dict
document_fetch_request_dict = document_fetch_request_instance.to_dict()
# create an instance of DocumentFetchRequest from a dict
document_fetch_request_from_dict = DocumentFetchRequest.from_dict(document_fetch_request_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


