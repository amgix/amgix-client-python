# WindowSample

Mergeable numerator/denominator stats for a single window.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | **float** | Mergeable numerator for the window | 
**n** | **int** | Mergeable denominator for average-like metrics | [optional] 

## Example

```python
from amgix_client.models.window_sample import WindowSample

# TODO update the JSON string below
json = "{}"
# create an instance of WindowSample from a JSON string
window_sample_instance = WindowSample.from_json(json)
# print the JSON string representation of the object
print(WindowSample.to_json())

# convert the object into a dict
window_sample_dict = window_sample_instance.to_dict()
# create an instance of WindowSample from a dict
window_sample_from_dict = WindowSample.from_dict(window_sample_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


