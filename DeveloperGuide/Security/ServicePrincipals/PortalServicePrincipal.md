# Portal service principal (`AzureAd:ClientId`)

This service principal is used by the DataHub Portal for **non-interactive calls to Microsoft Graph** and (in some cases) for **Azure management/billing** operations.

It is distinct from the infrastructure service principal (`AzureAd:InfraClientId`) which is used for privileged infrastructure health checks and other infra-level operations.

## Configuration

Portal app settings (with environment fallbacks depending on hosting):

- `AzureAd:TenantId`
- `AzureAd:ClientId`
- `AzureAd:ClientSecret`
- `AzureAd:SubscriptionId`

## Primary usage locations

- Graph user lookups (user email/name, etc.)
  - `Portal/src/Datahub.Infrastructure/Services/UserManagement/MSGraphService.cs` — [`ClientSecretCredential` from `AzureAd` for `GraphServiceClient`](https://github.com/ssc-sp/datahub-portal/tree/develop/Portal/src/Datahub.Infrastructure/Services/UserManagement/MSGraphService.cs#L97-L135)

- Azure management & Graph via SP
  - `Portal/src/Datahub.Infrastructure/Services/Azure/AzureManagementService.cs` — [`ClientSecretCredential` for Graph + token POST for ARM audience](https://github.com/ssc-sp/datahub-portal/tree/develop/Portal/src/Datahub.Infrastructure/Services/Azure/AzureManagementService.cs#L8-L77)
    - Used to create Graph users
    - Used to query billing API

- Catalog ingest utility (Graph)
  - `Portal/utils/CatalogIngestTool/Program.cs` — [`ClientSecretCredential` → `GraphServiceClient`](https://github.com/ssc-sp/datahub-portal/tree/develop/Portal/utils/CatalogIngestTool/Program.cs#L149-L184)

## Related

- Infrastructure service principal: [InfraServicePrincipal.md](/DeveloperGuide/Security/InfraServicePrincipal.md)
