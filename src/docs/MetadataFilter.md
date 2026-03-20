# MetadataFilter

Recursive metadata filter structure (modeled on Qdrant filter with and/or/not).

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
from amgix_client.models.metadata_filter import MetadataFilter

# TODO update the JSON string below
json = "{}"
# create an instance of MetadataFilter from a JSON string
metadata_filter_instance = MetadataFilter.from_json(json)
# print the JSON string representation of the object
print(MetadataFilter.to_json())

# convert the object into a dict
metadata_filter_dict = metadata_filter_instance.to_dict()
# create an instance of MetadataFilter from a dict
metadata_filter_from_dict = MetadataFilter.from_dict(metadata_filter_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


