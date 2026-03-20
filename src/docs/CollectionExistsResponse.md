# CollectionExistsResponse


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**exists** | **bool** |  | 

## Example

```python
from amgix_client.models.collection_exists_response import CollectionExistsResponse

# TODO update the JSON string below
json = "{}"
# create an instance of CollectionExistsResponse from a JSON string
collection_exists_response_instance = CollectionExistsResponse.from_json(json)
# print the JSON string representation of the object
print(CollectionExistsResponse.to_json())

# convert the object into a dict
collection_exists_response_dict = collection_exists_response_instance.to_dict()
# create an instance of CollectionExistsResponse from a dict
collection_exists_response_from_dict = CollectionExistsResponse.from_dict(collection_exists_response_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


