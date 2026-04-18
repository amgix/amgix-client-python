# NodeView

Snapshot of a single cluster node as last reported to the leader.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**role** | **str** | Node role: &#39;index&#39;, &#39;query&#39;, &#39;all&#39; for encoder nodes; &#39;api&#39; for API nodes | 
**is_leader** | **bool** | Whether this node is the current encoder leader | [optional] [default to False]
**last_seen** | **float** | Unix timestamp of the last heartbeat received from this node | 
**meta** | **Dict[str, object]** | Forward-compatible node metadata bag (for load/capacity/gpu/memory/model details and future node status values) | [optional] 
**metrics** | [**List[NodeMetricSeries]**](NodeMetricSeries.md) | Metric series for this node; empty for API nodes | [optional] 

## Example

```python
from amgix_client.models.node_view import NodeView

# TODO update the JSON string below
json = "{}"
# create an instance of NodeView from a JSON string
node_view_instance = NodeView.from_json(json)
# print the JSON string representation of the object
print(NodeView.to_json())

# convert the object into a dict
node_view_dict = node_view_instance.to_dict()
# create an instance of NodeView from a dict
node_view_from_dict = NodeView.from_dict(node_view_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


