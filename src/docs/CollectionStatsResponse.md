# CollectionStatsResponse

Persisted index statistics for a collection (encoder-maintained counts) and queue counts.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**doc_count** | **int** | Number of documents reflected in collection stats | 
**queue** | [**QueueInfo**](QueueInfo.md) | Counts of documents in each queue state | 

## Example

```python
from amgix_client.models.collection_stats_response import CollectionStatsResponse

# TODO update the JSON string below
json = "{}"
# create an instance of CollectionStatsResponse from a JSON string
collection_stats_response_instance = CollectionStatsResponse.from_json(json)
# print the JSON string representation of the object
print(CollectionStatsResponse.to_json())

# convert the object into a dict
collection_stats_response_dict = collection_stats_response_instance.to_dict()
# create an instance of CollectionStatsResponse from a dict
collection_stats_response_from_dict = CollectionStatsResponse.from_dict(collection_stats_response_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


