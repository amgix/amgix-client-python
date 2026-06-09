# DocumentFetchResponse

Response for paginated document fetching.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**documents** | [**List[Document]**](Document.md) | Page of documents | 
**after** | **str** | Pagination token for the next page. Null when there are no more documents. | [optional] 

## Example

```python
from amgix_client.models.document_fetch_response import DocumentFetchResponse

# TODO update the JSON string below
json = "{}"
# create an instance of DocumentFetchResponse from a JSON string
document_fetch_response_instance = DocumentFetchResponse.from_json(json)
# print the JSON string representation of the object
print(DocumentFetchResponse.to_json())

# convert the object into a dict
document_fetch_response_dict = document_fetch_response_instance.to_dict()
# create an instance of DocumentFetchResponse from a dict
document_fetch_response_from_dict = DocumentFetchResponse.from_dict(document_fetch_response_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


