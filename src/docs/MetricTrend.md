# MetricTrend

Historical buckets for a single metric key at a given resolution.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**key** | **str** | Metric key | 
**bucket_seconds** | **int** | Bucket resolution in seconds | 
**buckets** | [**List[MetricsBucket]**](MetricsBucket.md) | Buckets ordered by bucket_start ascending | [optional] 

## Example

```python
from amgix_client.models.metric_trend import MetricTrend

# TODO update the JSON string below
json = "{}"
# create an instance of MetricTrend from a JSON string
metric_trend_instance = MetricTrend.from_json(json)
# print the JSON string representation of the object
print(MetricTrend.to_json())

# convert the object into a dict
metric_trend_dict = metric_trend_instance.to_dict()
# create an instance of MetricTrend from a dict
metric_trend_from_dict = MetricTrend.from_dict(metric_trend_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


