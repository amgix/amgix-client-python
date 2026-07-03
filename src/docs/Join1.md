# Join1

Optional join of another collection onto each search result. Forms: '<collection>', '<collection>[<parent>=<child>]', or with '(<filter>)'. Parent refs: $id, $.meta.<key>. Child refs: $$id, $$.meta.<key>. Omitted '[]' defaults to [$id=$$id]. Joined documents appear under joined[collection_name].

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------

## Example

```python
from amgix_client.models.join1 import Join1

# TODO update the JSON string below
json = "{}"
# create an instance of Join1 from a JSON string
join1_instance = Join1.from_json(json)
# print the JSON string representation of the object
print(Join1.to_json())

# convert the object into a dict
join1_dict = join1_instance.to_dict()
# create an instance of Join1 from a dict
join1_from_dict = Join1.from_dict(join1_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


