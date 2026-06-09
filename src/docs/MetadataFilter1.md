# MetadataFilter1

Optional metadata filter. Accepts either a MetadataFilter object or a filter expression string (e.g. 'year > 2020 AND status = \"active\"'). Only fields declared in collection metadata_indexes can be filtered.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**var_and** | [**List[MetadataFilter]**](MetadataFilter.md) | All conditions in this list must match (AND) | [optional] 
**var_or** | [**List[MetadataFilter]**](MetadataFilter.md) | Any condition in this list must match (OR) | [optional] 
**var_not** | [**MetadataFilter**](MetadataFilter.md) | This condition must NOT match (NOT) | [optional] 
**key** | **str** | Metadata field key (for field condition) | [optional] 
**op** | **str** | Comparison operator | [optional] 
**value** | **object** |  | [optional] 

## Example

```python
from amgix_client.models.metadata_filter1 import MetadataFilter1

# TODO update the JSON string below
json = "{}"
# create an instance of MetadataFilter1 from a JSON string
metadata_filter1_instance = MetadataFilter1.from_json(json)
# print the JSON string representation of the object
print(MetadataFilter1.to_json())

# convert the object into a dict
metadata_filter1_dict = metadata_filter1_instance.to_dict()
# create an instance of MetadataFilter1 from a dict
metadata_filter1_from_dict = MetadataFilter1.from_dict(metadata_filter1_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


