# SearchResponse

Response from a search query.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**results** | [**List[SearchResult]**](SearchResult.md) | Search hits, ordered by relevance | 
**facet_counts** | **Dict[str, Dict[str, int]]** | Per-facet-field value counts over the search candidate pool. Only present when facets was True in the request. Keys are metadata field names; inner keys are stringified facet values; inner values are candidate counts. | [optional] 
**query_time_ms** | **float** | Server-side time to execute this search, in milliseconds | 

## Example

```python
from amgix_client.models.search_response import SearchResponse

# TODO update the JSON string below
json = "{}"
# create an instance of SearchResponse from a JSON string
search_response_instance = SearchResponse.from_json(json)
# print the JSON string representation of the object
print(SearchResponse.to_json())

# convert the object into a dict
search_response_dict = search_response_instance.to_dict()
# create an instance of SearchResponse from a dict
search_response_from_dict = SearchResponse.from_dict(search_response_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


