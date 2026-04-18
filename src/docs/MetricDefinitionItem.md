# MetricDefinitionItem


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**key** | **str** | Stable metric identifier | 
**unit** | **str** | Unit label (e.g. req, ms, batch) | 
**description** | **str** | Description of this metric | 

## Example

```python
from amgix_client.models.metric_definition_item import MetricDefinitionItem

# TODO update the JSON string below
json = "{}"
# create an instance of MetricDefinitionItem from a JSON string
metric_definition_item_instance = MetricDefinitionItem.from_json(json)
# print the JSON string representation of the object
print(MetricDefinitionItem.to_json())

# convert the object into a dict
metric_definition_item_dict = metric_definition_item_instance.to_dict()
# create an instance of MetricDefinitionItem from a dict
metric_definition_item_from_dict = MetricDefinitionItem.from_dict(metric_definition_item_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


