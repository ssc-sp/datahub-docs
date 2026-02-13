# Functions service principal (`FUNC_SP_CLIENT_ID`)

This service principal is used by the **Azure C# Functions** (ServerlessOperations) for non-interactive calls—primarily to Microsoft Graph.

## Configuration and Authentication

The project centralizes the Service Principal configuration in `AzureConfig.cs` and `ConfigureServices.cs`.

- **Credential Loading**: Credentials are mapped from environment variables in `ConfigureServices.cs`:
    - `TENANT_ID` -> `AzureAd:TenantId`
    - `FUNC_SP_CLIENT_ID` -> `AzureAd:ClientId`
    - `FUNC_SP_CLIENT_SECRET` -> `AzureAd:ClientSecret`
- **Client Provisioning**: The `AzureManagementService` class (injected into several functions) provides a pre-configured `GraphServiceClient` and ARM client using these credentials.

## Primary usage locations

- Graph client with SP creds for group membership checks
  - `ServerlessOperations/src/Datahub.Functions/GetUsersStatus.cs` — [`ClientSecretCredential` for Graph, uses `ServicePrincipalGroupID`](https://github.com/ssc-sp/datahub-portal/tree/develop/ServerlessOperations/src/Datahub.Functions/GetUsersStatus.cs#L20-L61)


## Identity and Access Management (Microsoft Graph)
These functions use the Service Principal to manage users and permissions in Azure Active Directory.

| Function          | File                 | Purpose                                                                                                                                           |
| :---------------- | :------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------ |
| `CreateGraphUser` | `CreateGraphUser.cs` | Uses the SP to **invite external users** to the tenant and **add them to the Service Principal Group** (defined by `SP_GROUP_ID`).                |
| `AddUserToGroup`  | `CreateGraphUser.cs` | Programmatically adds a specified user ID to the administrative group.                                                                            |
| `GetUsersStatus`  | `GetUsersStatus.cs`  | Authenticates using `ClientSecretCredential` to fetch lists of **locked users** (`accountEnabled eq false`) and query members of specific groups. |

## Resource and Cost Management (Azure Resource Manager)
These functions leverage the Service Principal to monitor and manage Azure resources and associated costs. The SP typically requires "Contributor" or "Cost Management Reader" roles at the subscription or resource group level.

| Function                      | File                     | Purpose                                                                                                                                               |
| :---------------------------- | :----------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ProjectUsageUpdater`         | `ProjectUsageUpdater.cs` | Interacts with `IWorkspaceCostManagementService` and `IWorkspaceBudgetManagementService` to track spending and manage budgets for project workspaces. |
| `ProjectCapacityUsageUpdater` | `ProjectUsageUpdater.cs` | Uses `IWorkspaceStorageManagementService` to calculate and update the storage consumption of workspace-associated storage accounts.                   |

## DevOps Integration (Azure DevOps API)
The Service Principal is used to bridge the Datahub Portal with Azure DevOps for infrastructure automation.

| Function                       | File                              | Purpose                                                                                                                                                                |
| :----------------------------- | :-------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ConfigureWorkspaceAppService` | `ConfigureWorkspaceAppService.cs` | Uses SP credentials (via `AzureDevOpsClient`) to **trigger Azure DevOps pipelines**. Specifically, it runs pipelines to configure App Services for project workspaces. |
