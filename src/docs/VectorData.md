# VectorData

Vector data for a specific vector. Contains the precalculated vector values, which can be either dense or sparse.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**vector_name** | **str** | Name of the vector | 
**var_field** | **str** | Field this vector is for (name, description, content, or template) | 
**vector_type** | **str** | Type of vector (dense_model, sparse_model, full_text, trigrams, whitespace, wmtr, dense_custom, sparse_custom) | 
**dense_vector** | **List[float]** | Dense vector values as a list of floats | [optional] 
**sparse_indices** | **List[int]** | Sparse vector indices (token positions) | [optional] 
**sparse_values** | **List[float]** | Sparse vector values (token weights) | [optional] 

## Example

```python
from amgix_client.models.vector_data import VectorData

# TODO update the JSON string below
json = "{}"
# create an instance of VectorData from a JSON string
vector_data_instance = VectorData.from_json(json)
# print the JSON string representation of the object
print(VectorData.to_json())

# convert the object into a dict
vector_data_dict = vector_data_instance.to_dict()
# create an instance of VectorData from a dict
vector_data_from_dict = VectorData.from_dict(vector_data_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


