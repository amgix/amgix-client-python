# DocumentStatusResponse

Complete status response for a document including queue states.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**statuses** | [**List[DocumentStatus]**](DocumentStatus.md) | List of statuses sorted by timestamp (newest first) | 

## Example

```python
from amgix_client.models.document_status_response import DocumentStatusResponse

# TODO update the JSON string below
json = "{}"
# create an instance of DocumentStatusResponse from a JSON string
document_status_response_instance = DocumentStatusResponse.from_json(json)
# print the JSON string representation of the object
print(DocumentStatusResponse.to_json())

# convert the object into a dict
document_status_response_dict = document_status_response_instance.to_dict()
# create an instance of DocumentStatusResponse from a dict
document_status_response_from_dict = DocumentStatusResponse.from_dict(document_status_response_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


