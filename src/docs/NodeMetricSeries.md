# NodeMetricSeries

One metric stream on a node with mergeable window stats.  key is the metric name (e.g. 'batches', 'inference_ms', 'inference_origin_ms', 'hops'). dims are optional dimensions (e.g. vector type, model name, revision). windows are keyed by window size in seconds.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**key** | **str** | Metric name | 
**dims** | **List[str]** | Optional metric dimensions | [optional] 
**windows** | [**Dict[str, WindowSample]**](WindowSample.md) | Rolling-window snapshots keyed by window size in seconds | [optional] 
**last_seen** | **float** | UTC timestamp (time.time()) of the most recent sample for this series | [optional] 

## Example

```python
from amgix_client.models.node_metric_series import NodeMetricSeries

# TODO update the JSON string below
json = "{}"
# create an instance of NodeMetricSeries from a JSON string
node_metric_series_instance = NodeMetricSeries.from_json(json)
# print the JSON string representation of the object
print(NodeMetricSeries.to_json())

# convert the object into a dict
node_metric_series_dict = node_metric_series_instance.to_dict()
# create an instance of NodeMetricSeries from a dict
node_metric_series_from_dict = NodeMetricSeries.from_dict(node_metric_series_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


