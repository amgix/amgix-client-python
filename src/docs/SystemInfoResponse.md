# SystemInfoResponse


## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amgix_version** | **str** | API / deployment version string | 
**database_kind** | **str** | Database product derived from configured URL scheme (no connection string) | 
**database_version** | **str** | Version reported by the database backend after probe | 
**database_features** | **Dict[str, bool]** | Feature flags detected at probe time (e.g. dense vector support) | 
**rabbitmq_version** | **str** | AMQP broker version from Connection.Start server_properties (e.g. RabbitMQ) | 
**collection_count** | **int** | Number of user collections | 

## Example

```python
from amgix_client.models.system_info_response import SystemInfoResponse

# TODO update the JSON string below
json = "{}"
# create an instance of SystemInfoResponse from a JSON string
system_info_response_instance = SystemInfoResponse.from_json(json)
# print the JSON string representation of the object
print(SystemInfoResponse.to_json())

# convert the object into a dict
system_info_response_dict = system_info_response_instance.to_dict()
# create an instance of SystemInfoResponse from a dict
system_info_response_from_dict = SystemInfoResponse.from_dict(system_info_response_dict)
```
[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


