# Join

Optional join of another collection onto each fetched document. Forms: '<collection>', '<collection>[<parent>=<child>]', or with '(<filter>)'. Parent refs: $id, $.meta.<key>. Child refs: $$id, $$.meta.<key>. Omitted '[]' defaults to [$id=$$id]. Joined documents appear under joined[collection_name].

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------

## Example

```python
from amgix_client.models.join import Join

# TODO update the JSON string below
json = "{}"
# create an instance of Join from a JSON string
join_instance = Join.from_json(json)
# print the JSON string representation of the object
print(Join.to_json())

# convert the object into a dict
join_dict = join_instance.to_dict()
# create an instance of Join from a dict
join_from_dict = Join.from_dict(join_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


