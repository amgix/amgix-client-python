# SearchResult

A search result containing document information and its relevance score. Inherits from Document but excludes content field and adds score.  Validation is disabled for SearchResult as it is constructed internally from validated data.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **str** | Unique identifier for the document (max 100 characters) | 
**timestamp** | **datetime** | UTC timestamp when the document was created/updated | 
**tags** | **List[str]** | List of document tags (max 50 items; each max 100 characters; cannot contain pipe characters) | [optional] 
**name** | **str** | Document name (max 1500 characters) | [optional] 
**description** | **str** | Brief description of the document (max 3000 characters) | [optional] 
**metadata** | **Dict[str, object]** | Dictionary of metadata key-value pairs. Values can be simple types (string, int, float, bool) or MetaValue objects (required for datetime) | [optional] 
**custom_vectors** | [**List[CustomDocumentVector]**](CustomDocumentVector.md) | Pre-generated custom vectors for this document (optional) | [optional] 
**score** | **float** | The relevance score for this document | 
**vector_scores** | [**List[VectorScore]**](VectorScore.md) | Raw per-vector scores with field, vector, score, and rank information | [optional] 

## Example

```python
from amgix_client.models.search_result import SearchResult

# TODO update the JSON string below
json = "{}"
# create an instance of SearchResult from a JSON string
search_result_instance = SearchResult.from_json(json)
# print the JSON string representation of the object
print(SearchResult.to_json())

# convert the object into a dict
search_result_dict = search_result_instance.to_dict()
# create an instance of SearchResult from a dict
search_result_from_dict = SearchResult.from_dict(search_result_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


