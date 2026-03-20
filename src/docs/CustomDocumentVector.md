# CustomDocumentVector

Custom vector for documents - adds field specification

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**vector_name** | **str** | Name of the vector (must match collection config) | 
**vector** | [**Vector**](Vector.md) |  | 
**var_field** | **str** | Document field this vector is for (name, description, or content) | 

## Example

```python
from amgix_client.models.custom_document_vector import CustomDocumentVector

# TODO update the JSON string below
json = "{}"
# create an instance of CustomDocumentVector from a JSON string
custom_document_vector_instance = CustomDocumentVector.from_json(json)
# print the JSON string representation of the object
print(CustomDocumentVector.to_json())

# convert the object into a dict
custom_document_vector_dict = custom_document_vector_instance.to_dict()
# create an instance of CustomDocumentVector from a dict
custom_document_vector_from_dict = CustomDocumentVector.from_dict(custom_document_vector_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


