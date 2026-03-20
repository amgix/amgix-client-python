# QueueInfo

Queue statistics for a collection. Provides counts of documents in different queue states.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**queued** | **int** | Number of documents queued for processing | 
**requeued** | **int** | Number of documents requeued after failure | 
**failed** | **int** | Number of failed documents | 
**total** | **int** | Total number of queue entries | 

## Example

```python
from amgix_client.models.queue_info import QueueInfo

# TODO update the JSON string below
json = "{}"
# create an instance of QueueInfo from a JSON string
queue_info_instance = QueueInfo.from_json(json)
# print the JSON string representation of the object
print(QueueInfo.to_json())

# convert the object into a dict
queue_info_dict = queue_info_instance.to_dict()
# create an instance of QueueInfo from a dict
queue_info_from_dict = QueueInfo.from_dict(queue_info_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


