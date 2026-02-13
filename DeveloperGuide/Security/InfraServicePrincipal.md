# Infrastructure service principal (`AzureAd:InfraClientId`)

This service principal is used by the DataHub Portal for **non-interactive, privileged infrastructure operations**.

## Configuration

- `AzureAd:TenantId`
- `AzureAd:SubscriptionId`
- `AzureAd:InfraClientId`
- `AzureAd:InfraClientSecret`

## Primary usage

- `HealthCheckHelper` health checks for core infrastructure (Key Vault, Functions, Storage, Service Bus, Databricks).
- Azure Resource Manager (ARM) calls (for example, retrieving Azure Function host keys) via `ArmClient` authenticated with `ClientSecretCredential(AzureTenantId, InfraClientId, InfraClientSecret)`.
- Databricks health checks where an Azure DevOps token is acquired (via the infra SP credentials) and then used to call Databricks endpoints.

## `HealthCheckHelper` – Azure Services Access Summary

`HealthCheckHelper` (in `Portal/src/Datahub.Infrastructure/Services/Helpers/HealthCheckHelper.cs`) performs a variety of infrastructure health checks by calling into multiple Azure services. Below is a concise summary by service.

## Azure Key Vault

**Where:** `CheckAzureKeyVault`

**Vaults:**

- Core vault:
  - `https://fsdh-key-{env}.vault.azure.net/`
- Workspace vaults:
  - `https://fsdh-proj-{workspace}-{env}-kv.vault.azure.net/`

**Operations:**

- Core group:
  - `GetSecretAsync("datahubportal-client-id")`
- Workspace group:
  - `GetKeyAsync("project-cmk")`
- For all groups:
  - Enumerate secrets: `GetPropertiesOfSecretsAsync()` and check `ExpiresOn`.
  - Enumerate keys: `GetPropertiesOfKeysAsync()` and check `ExpiresOn`.

## Azure Functions (Function App)

There are two levels of interaction:

### Azure Resource Manager (ARM) – to get host keys

**Where:** `GetAzureFunctionDefaultKey`

**Credentials:**

- `ClientSecretCredential(AzureTenantId, InfraClientId, InfraClientSecret)`

**SDK Clients:**

- `ArmClient`
- `SubscriptionResource`
- `ResourceGroupResource`
- `WebSiteResource` (Function App)

**Resource hierarchy:**

- Subscription: from `AzureAd.SubscriptionId`
- Resource group:
  - `fsdh-{env}-rg`
- Function App name:
  - `fsdh-func-dotnet-{env}`

**Operations:**

- `GetResourceGroupAsync("fsdh-{env}-rg")`
- `GetWebSiteAsync("fsdh-func-dotnet-{env}")`
- `GetHostKeysAsync()` and read `FunctionKeys["default"]`

### HTTP-triggered Functions endpoint

**Where:** `CheckAzureFunctions`

**URL pattern:**

- Base:
  - `https://fsdh-func-dotnet-{env}.azurewebsites.net`
- Health-check function:
  - `/api/FunctionsHealthCheck?code={defaultKey}`

**Operations:**

- `HttpClient.GetAsync(azureFunctionUrl)`
- Status code and body inspection to determine health.

## Azure Storage (Blob)

**Where:** `CheckAzureStorageAccount`

**Supporting services:**

- `IProjectStorageConfigurationService` for:
  - `GetProjectStorageAccountName(projectAcronym)`
  - `GetProjectStorageAccountKey(projectAcronym)`

**SDK wrapper:**

- `AzureCloudStorageManager(accountName, accountKey)` (your custom class over Azure Storage SDK).

**Operations:**

- `GetContainersAsync()`
  - Ensures there is at least one container.
- `GetStorageMetadataAsync(container)`
  - Ensures metadata is retrievable for a container.

**Service:** Azure Storage – Blob service (per-project storage accounts).

---

## Azure Storage Queues

**Where:** `CheckAzureStorageQueue`

**Configuration key:**

- `DatahubStorageQueue:ConnectionString`

**SDK client:**

- `QueueClient(storageConnectionString, queueName)`

**Queue name resolution:**

- For normal queue:
  - `queueName = request.Name`
- For poison queue:
  - `queueName = request.Name + "-poison"`

**Operations:**

- `ExistsAsync()` to check presence and connectivity.

**Service:** Azure Storage Queue service.

---

## Azure Service Bus

**Where:** `CheckAzureServiceBusQueue`

**Configuration key:**

- `DatahubServiceBus:ConnectionString`

**SDK client:**

- `ServiceBusClient`
- `ServiceBusReceiver`

**Queues:**

- Main queues: values from `ServiceBusQueueHealthChecks` (e.g. `PongQueueName`, `BugReportQueueName`, `InfrastructureHealthCheckQueueName`, etc.).
- Dead-letter queues:
  - `SubQueue = SubQueue.DeadLetter` when `request.Group` indicates poison.

**Operations:**

- `CreateReceiver(queueName, options)`
- `PeekMessageAsync()` to:
  - Verify queue exists / is reachable.
  - For dead-letter queues, optionally inspect `DeadLetterReason`.

**Service:** Azure Service Bus (standard queues + dead-letter subqueues).

---

## Azure Databricks (via Azure DevOps)

**Where:** `CheckAzureDatabricksHealth`

**Prerequisites:**

- Project resources must indicate the Databricks module is provisioned.
- Databricks URL extracted using `TerraformVariableExtraction.ExtractDatabricksUrl(project, null)`.

**Databricks operations:**

- `IsDatabricksInstanceRunning()`
- `VerifyACLStatus()`
- `GetClusterStatus("")` (checks cluster state is `"Running"`).

## Other Azure-related Touchpoints

### 8.1 Workspace Web App (Azure App Service)

**Where:** `CheckWebApp`

**Supporting services:**

- `IWorkspaceWebAppManagementService`

**Flow:**

- Uses project resource metadata (App Service config) extracted via:
  - `TerraformVariableExtraction.ExtractAppServiceConfiguration(project)`
- Checks:
  - If an App Service resource was requested (Terraform module).
  - If `HostName` and/or `Id` are set (provisioned).
  - Uses `workspaceWebAppManagementService.GetState(appServiceConfig.Id)` to confirm if the app is running.

**Service:** Azure App Service (Web Apps) per workspace, via an abstraction rather than direct Azure SDK calls in this class.

---

## 9. Summary Table

| Category                | Azure Service / Resource                     | How Accessed                                       |
|-------------------------|----------------------------------------------|----------------------------------------------------|
| Database                | Azure SQL Database                           | EF Core `DatahubProjectDBContext`                  |
| Secrets & keys          | Azure Key Vault (core + per-project)        | `DefaultAzureCredential`, `SecretClient`, `KeyClient` |
| Functions configuration | Azure Functions (via ARM)                   | `ClientSecretCredential` + `ArmClient`             |
| Functions runtime       | Azure Functions HTTP endpoint               | `HttpClient` calling `/api/FunctionsHealthCheck`   |
| Storage – data          | Azure Storage Blob                          | `AzureCloudStorageManager`                         |
| Storage – queues        | Azure Storage Queues                        | `QueueClient.ExistsAsync()`                        |
| Messaging               | Azure Service Bus                           | `ServiceBusClient`, `ServiceBusReceiver`           |
| Analytics/platform      | Azure Databricks                            | `DatabricksClientUtils` using Azure DevOps token   |
| DevOps                  | Azure DevOps                                | `AzureDevOpsClient` (infra SP credentials)         |
| App hosting             | Azure App Service (Web Apps per workspace)  | `IWorkspaceWebAppManagementService.GetState()`     |

All of these are driven by configuration from `DatahubPortalConfiguration`, particularly the `AzureAd` section using the `InfraClientId`/`InfraClientSecret` service principal for non-interactive infrastructure checks.
