# BulkUploadRequest


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**documents** | [**List[Document]**](Document.md) |  | 

## Example

```python
from amgix_client.models.bulk_upload_request import BulkUploadRequest

# TODO update the JSON string below
json = "{}"
# create an instance of BulkUploadRequest from a JSON string
bulk_upload_request_instance = BulkUploadRequest.from_json(json)
# print the JSON string representation of the object
print(BulkUploadRequest.to_json())

# convert the object into a dict
bulk_upload_request_dict = bulk_upload_request_instance.to_dict()
# create an instance of BulkUploadRequest from a dict
bulk_upload_request_from_dict = BulkUploadRequest.from_dict(bulk_upload_request_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


