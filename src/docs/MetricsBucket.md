# MetricsBucket

One mergeable aligned bucket that can be used for live and historical metrics.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**key** | **str** | Metric name for this bucket | 
**dims** | **List[str]** | Optional metric dimensions for this bucket | [optional] 
**bucket_start** | **int** | Unix timestamp of the inclusive bucket start boundary | 
**bucket_seconds** | **int** | Bucket duration in seconds | 
**value** | **float** | Mergeable numerator for the bucket | 
**n** | **int** | Mergeable denominator for average-like metrics | [optional] 

## Example

```python
from amgix_client.models.metrics_bucket import MetricsBucket

# TODO update the JSON string below
json = "{}"
# create an instance of MetricsBucket from a JSON string
metrics_bucket_instance = MetricsBucket.from_json(json)
# print the JSON string representation of the object
print(MetricsBucket.to_json())

# convert the object into a dict
metrics_bucket_dict = metrics_bucket_instance.to_dict()
# create an instance of MetricsBucket from a dict
metrics_bucket_from_dict = MetricsBucket.from_dict(metrics_bucket_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


