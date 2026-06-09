# CollectionConfig

API model for collection configuration - uses VectorConfig.  If ``vectors`` is omitted or empty a single noop vector is injected automatically, creating a payload-only collection.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**vectors** | [**List[VectorConfig]**](VectorConfig.md) | List of vector configurations for this collection | [optional] 
**store_content** | **bool** | Whether to store document content in the database. | [optional] [default to True]
**metadata_indexes** | [**List[MetadataIndex]**](MetadataIndex.md) | List of metadata fields to index for filtering and sorting | [optional] 

## Example

```python
from amgix_client.models.collection_config import CollectionConfig

# TODO update the JSON string below
json = "{}"
# create an instance of CollectionConfig from a JSON string
collection_config_instance = CollectionConfig.from_json(json)
# print the JSON string representation of the object
print(CollectionConfig.to_json())

# convert the object into a dict
collection_config_dict = collection_config_instance.to_dict()
# create an instance of CollectionConfig from a dict
collection_config_from_dict = CollectionConfig.from_dict(collection_config_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


