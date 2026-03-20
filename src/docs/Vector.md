# Vector

Vector data: dense (list of floats) or sparse (list of (index, value) tuples)

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------

## Example

```python
from amgix_client.models.vector import Vector

# TODO update the JSON string below
json = "{}"
# create an instance of Vector from a JSON string
vector_instance = Vector.from_json(json)
# print the JSON string representation of the object
print(Vector.to_json())

# convert the object into a dict
vector_dict = vector_instance.to_dict()
# create an instance of Vector from a dict
vector_from_dict = Vector.from_dict(vector_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


