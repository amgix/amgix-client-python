# VectorScore

Individual vector score for a search result

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**var_field** | **str** | Document field that was searched (name, description, content) | 
**vector** | **str** | Vector name that was used (wmtr, splade, dense, etc.) | 
**score** | **float** | Raw score from this vector | 
**rank** | **int** | Rank of this result within this vector&#39;s results (1-based) | 

## Example

```python
from amgix_client.models.vector_score import VectorScore

# TODO update the JSON string below
json = "{}"
# create an instance of VectorScore from a JSON string
vector_score_instance = VectorScore.from_json(json)
# print the JSON string representation of the object
print(VectorScore.to_json())

# convert the object into a dict
vector_score_dict = vector_score_instance.to_dict()
# create an instance of VectorScore from a dict
vector_score_from_dict = VectorScore.from_dict(vector_score_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


