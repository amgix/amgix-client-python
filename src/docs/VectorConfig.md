# VectorConfig

Configuration for a vector generation method.  This model defines how vectors should be generated for a specific field or set of fields. Different vector types have different requirements and behaviors.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **str** | Unique name for this vector configuration | 
**type** | **str** | Type of vector (dense_model, sparse_model, full_text, trigrams, whitespace, wmtr, dense_custom, sparse_custom) | 
**model** | **str** | Model name for transformer-based vectors (max 210 characters, e.g., &#39;sentence-transformers/all-MiniLM-L6-v2&#39;). Used for document indexing. | [optional] 
**revision** | **str** | Optional model revision (max 210 characters, branch/tag/commit) for specific model version. Used for document indexing. | [optional] 
**query_model** | **str** | Optional model name for query vectorization (max 210 characters). If not specified, uses &#39;model&#39; for both documents and queries. | [optional] 
**query_revision** | **str** | Optional model revision for query vectorization (max 210 characters). If not specified, uses &#39;revision&#39; for both documents and queries. | [optional] 
**dimensions** | **int** | Dimensions for the vector. Required for dense_custom vectors. For dense_model vectors, auto-detected if not specified. | [optional] 
**top_k** | **int** | Number of top-scoring terms to keep for sparse vectors. Used by sparse_model, full_text, trigrams, whitespace, wmtr, and sparse_custom vectors. Ignored by dense vectors. | [optional] [default to 128]
**wmtr_word_weight** | **int** | Percentage of WMTR top_k allocated to word weights. | [optional] [default to 80]
**index_fields** | **List[str]** | List of fields to index with this vector (name, description, content). Defaults to [&#39;content&#39;] if not specified. | [optional] 
**language_default_code** | **str** | Two-letter ISO 639-1 language code for language-based vector types (e.g., &#39;en&#39;, &#39;es&#39;, &#39;fr&#39;) | [optional] [default to 'en']
**language_detect** | **bool** | Whether to automatically detect language for language-based vector types | [optional] [default to False]
**language_confidence** | **float** | Minimum confidence threshold for language detection. If detection confidence is below this value, language_default_code will be used instead. | [optional] [default to 0.9]
**normalization** | **bool** | Whether to normalize vectors. Only supported for dense vectors. Sparse vectors do not support normalization. | [optional] 
**dense_distance** | **str** | Distance metric for dense vectors (cosine, dot, euclid). Defaults to cosine. | [optional] [default to 'cosine']
**keep_case** | **bool** | Whether to keep original case for text preprocessing. Only applies to model-based vectors (dense_model, sparse_model). Defaults to False (lowercase). | [optional] [default to False]

## Example

```python
from amgix_client.models.vector_config import VectorConfig

# TODO update the JSON string below
json = "{}"
# create an instance of VectorConfig from a JSON string
vector_config_instance = VectorConfig.from_json(json)
# print the JSON string representation of the object
print(VectorConfig.to_json())

# convert the object into a dict
vector_config_dict = vector_config_instance.to_dict()
# create an instance of VectorConfig from a dict
vector_config_from_dict = VectorConfig.from_dict(vector_config_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


