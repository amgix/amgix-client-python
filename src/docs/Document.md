# Document

Document model representing the structure of documents in the system.  This model is used for document ingestion, retrieval, and search results. Content is excluded from database storage for performance and cost reasons.

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **str** | Unique identifier for the document (max 100 characters) | 
**timestamp** | **datetime** | UTC timestamp when the document was created/updated | 
**tags** | **List[str]** | List of document tags (max 50 items; each max 100 characters; cannot contain pipe characters) | [optional] 
**name** | **str** | Document name (max 1500 characters) | [optional] 
**description** | **str** | Brief description of the document (max 3000 characters) | [optional] 
**content** | **str** | Main content of the document (max 1000000 characters) | [optional] 
**metadata** | **Dict[str, object]** | Dictionary of metadata key-value pairs. Values can be simple types (string, int, float, bool) or MetaValue objects (required for datetime) | [optional] 
**custom_vectors** | [**List[CustomDocumentVector]**](CustomDocumentVector.md) | Pre-generated custom vectors for this document (optional) | [optional] 

## Example

```python
from amgix_client.models.document import Document

# TODO update the JSON string below
json = "{}"
# create an instance of Document from a JSON string
document_instance = Document.from_json(json)
# print the JSON string representation of the object
print(Document.to_json())

# convert the object into a dict
document_dict = document_instance.to_dict()
# create an instance of Document from a dict
document_from_dict = Document.from_dict(document_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


