## How to query Datahub App Insights?

- Open Azure Portal
- On the Search resources box paste "Application Insights"
- Click the link to "Application Insights" a list will show in the left hand side.
- From the resulting list select the correct Application Insights, for example for PoC Portal it is "fsdh-app-insights-portal-dev"
- After selecting the desired App Insights, hide the list (optional)
- Select the "Logs" tab or select the "Logs" option from Monitoring section on the left menu. It is the same.
- Close the Queries windows that will pop-up, we don't need it.
- Now you can type and run queries, examples are shown next.

## How to list all the events for a specific user?

Type: 

```
customEvents
| where customDimensions.userName == "FULL_USER_NAME"

```

Or 

```
customEvents
| where customDimensions.userName contains "A_NAME"

```

## How to list data events?

```
customEvents
| where name == "DataEvent"
```

The filters can be combined with ands of extra 'where' clauses, for example, all the data events for a user named "John"

```
customEvents
| where customDimensions.userName contains "A_NAME"
| where name == "DataEvent"
```

DataEvents are changes performed to the DB related to the actions performed by the logged user.

Note: We store event related properties in the customDimensions of the event. For example:
```
	AspNetCoreEnvironment: dev
	changeType: Delete
	objectId: MetadataProfile {ProfileId: 4} Deleted
	table: MetadataProfile
	userId: 34a16480-1c78-4b65-933f-c6cce336346b
	userName: Iroel Perez-Garcia
	userPrincipalName: iperez_apption.com#EXT#@163oxygen.onmicrosoft.com
```    
	
	