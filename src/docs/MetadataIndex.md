# MetadataIndex

Metadata field index configuration

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**key** | **str** | Metadata field key to index | 
**type** | **str** | Type of the metadata value | 

## Example

```python
from amgix_client.models.metadata_index import MetadataIndex

# TODO update the JSON string below
json = "{}"
# create an instance of MetadataIndex from a JSON string
metadata_index_instance = MetadataIndex.from_json(json)
# print the JSON string representation of the object
print(MetadataIndex.to_json())

# convert the object into a dict
metadata_index_dict = metadata_index_instance.to_dict()
# create an instance of MetadataIndex from a dict
metadata_index_from_dict = MetadataIndex.from_dict(metadata_index_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


