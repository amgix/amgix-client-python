# FacetOptions

Tuning for faceting; used only when SearchQuery.facets is True.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**prefetch_multiplier** | **int** | Multiplier on query.limit setting the per-arm candidate window for facet computation. The window is floored to at least 50 candidates. Larger multipliers yield more accurate distributions at higher cost (1 to 10). | [optional] [default to 2]
**max_values** | **int** | Maximum distinct values returned per facet field, kept as the top-N by count (1 to 100). | [optional] [default to 10]

## Example

```python
from amgix_client.models.facet_options import FacetOptions

# TODO update the JSON string below
json = "{}"
# create an instance of FacetOptions from a JSON string
facet_options_instance = FacetOptions.from_json(json)
# print the JSON string representation of the object
print(FacetOptions.to_json())

# convert the object into a dict
facet_options_dict = facet_options_instance.to_dict()
# create an instance of FacetOptions from a dict
facet_options_from_dict = FacetOptions.from_dict(facet_options_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


