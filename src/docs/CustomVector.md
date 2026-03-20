# CustomVector

Base custom vector model for search queries

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**vector_name** | **str** | Name of the vector (must match collection config) | 
**vector** | [**Vector**](Vector.md) |  | 

## Example

```python
from amgix_client.models.custom_vector import CustomVector

# TODO update the JSON string below
json = "{}"
# create an instance of CustomVector from a JSON string
custom_vector_instance = CustomVector.from_json(json)
# print the JSON string representation of the object
print(CustomVector.to_json())

# convert the object into a dict
custom_vector_dict = custom_vector_instance.to_dict()
# create an instance of CustomVector from a dict
custom_vector_from_dict = CustomVector.from_dict(custom_vector_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


