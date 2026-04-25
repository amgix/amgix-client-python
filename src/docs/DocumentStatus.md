# DocumentStatus

Individual status entry for a document.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**status** | **str** | Status of the document (queued, requeued, indexed, failed) | 
**op_type** | **str** | Queue operation type (upsert or delete) for queue-related statuses | [optional] 
**info** | **str** | Status information | [optional] 
**timestamp** | **datetime** | When this status occurred | 
**queue_id** | **str** | Queue entry ID (only for queue-related statuses) | [optional] 
**try_count** | **int** | Number of processing attempts (only for failed statuses) | [optional] 

## Example

```python
from amgix_client.models.document_status import DocumentStatus

# TODO update the JSON string below
json = "{}"
# create an instance of DocumentStatus from a JSON string
document_status_instance = DocumentStatus.from_json(json)
# print the JSON string representation of the object
print(DocumentStatus.to_json())

# convert the object into a dict
document_status_dict = document_status_instance.to_dict()
# create an instance of DocumentStatus from a dict
document_status_from_dict = DocumentStatus.from_dict(document_status_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


