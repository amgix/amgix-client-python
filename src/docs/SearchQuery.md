# SearchQuery

Configuration for a search query. Defines the query string and vector weights. This is the model that will be sent by end users to the search API endpoint.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**query** | **str** | The search query string (max 10000 characters) | 
**vector_weights** | [**List[VectorSearchWeight]**](VectorSearchWeight.md) | List of vectors, fields, and weights to use for searching. If empty, equal weights will be auto-generated for all available vectors. | [optional] [default to []]
**custom_vectors** | [**List[CustomVector]**](CustomVector.md) | Pre-generated custom vectors for this search query (optional) | [optional] 
**limit** | **int** | Maximum number of results to return (1 to 100) | [optional] [default to 10]
**score_threshold** | **float** | Optional minimum score threshold. Results below this score will be excluded | [optional] 
**document_tags** | **List[str]** | Optional filter to include only documents with specific tags (max 50 tags, each max 100 characters; cannot contain pipe characters) | [optional] 
**document_tags_match_all** | **bool** | If True, documents must have ALL specified tags (AND). If False, documents must have ANY of the specified tags (OR). | [optional] [default to False]
**metadata_filter** | [**MetadataFilter**](MetadataFilter.md) | Optional recursive metadata filter. Only fields declared in collection metadata_indexes can be filtered. | [optional] 
**raw_scores** | **bool** | Whether to include individual vector scores in results | [optional] [default to False]
**wmtr_trigram_weight** | **float** | WMTR trigram channel multiplier for this search query. | [optional] [default to 1.0]
**fusion_mode** | **str** | How to combine multi-vector search results. &#39;rrf&#39; &#x3D; reciprocal rank fusion (rank-based). &#39;linear&#39; &#x3D; min-max normalize each retriever&#39;s scores on its prefetch list, then sum weight * normalized score. | [optional] [default to 'rrf']

## Example

```python
from amgix_client.models.search_query import SearchQuery

# TODO update the JSON string below
json = "{}"
# create an instance of SearchQuery from a JSON string
search_query_instance = SearchQuery.from_json(json)
# print the JSON string representation of the object
print(SearchQuery.to_json())

# convert the object into a dict
search_query_dict = search_query_instance.to_dict()
# create an instance of SearchQuery from a dict
search_query_from_dict = SearchQuery.from_dict(search_query_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


