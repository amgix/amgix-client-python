# VectorSearchOption

Configuration for a vector search option. Used in search queries to specify which vectors to search with and their weights.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**vector_name** | **str** | Name of the vector to search with | 
**weight** | **float** | Weight to apply to this vector&#39;s search results | [optional] [default to 1.0]
**var_field** | **str** | Field to search with this vector (name, description, content) | 
**wmtr_trigram_weight** | **float** | WMTR trigram channel multiplier for this vector option (used when vector_name is a WMTR vector). | [optional] [default to 1.0]

## Example

```python
from amgix_client.models.vector_search_option import VectorSearchOption

# TODO update the JSON string below
json = "{}"
# create an instance of VectorSearchOption from a JSON string
vector_search_option_instance = VectorSearchOption.from_json(json)
# print the JSON string representation of the object
print(VectorSearchOption.to_json())

# convert the object into a dict
vector_search_option_dict = vector_search_option_instance.to_dict()
# create an instance of VectorSearchOption from a dict
vector_search_option_from_dict = VectorSearchOption.from_dict(vector_search_option_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


