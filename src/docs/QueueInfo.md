# QueueInfo

Queue statistics for a collection. Provides counts of documents in different queue states.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**queued_upsert** | **int** | Number of upsert queue entries queued for processing | 
**queued_delete** | **int** | Number of delete queue entries queued for processing | 
**requeued_upsert** | **int** | Number of upsert queue entries requeued after failure | 
**requeued_delete** | **int** | Number of delete queue entries requeued after failure | 
**failed_upsert** | **int** | Number of failed upsert queue entries | 
**failed_delete** | **int** | Number of failed delete queue entries | 
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


