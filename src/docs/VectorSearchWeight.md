# VectorSearchWeight

Configuration for a vector search weight. Used in search queries to specify which vectors to search with and their weights.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**vector_name** | **str** | Name of the vector to search with | 
**weight** | **float** | Weight to apply to this vector&#39;s search results | [optional] [default to 1.0]
**var_field** | **str** | Field to search with this vector (name, description, content) | 

## Example

```python
from amgix_client.models.vector_search_weight import VectorSearchWeight

# TODO update the JSON string below
json = "{}"
# create an instance of VectorSearchWeight from a JSON string
vector_search_weight_instance = VectorSearchWeight.from_json(json)
# print the JSON string representation of the object
print(VectorSearchWeight.to_json())

# convert the object into a dict
vector_search_weight_dict = vector_search_weight_instance.to_dict()
# create an instance of VectorSearchWeight from a dict
vector_search_weight_from_dict = VectorSearchWeight.from_dict(vector_search_weight_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


