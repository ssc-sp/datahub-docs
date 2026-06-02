# Datahub.Portal — External Services Summary

This document lists all external services consumed by the Datahub.Portal application and its transitive project dependencies.

## Dependency Tree

```
Datahub.Portal
├── Datahub.Application
│   └── Datahub.Core
│       ├── Datahub.Markdown
│       ├── Datahub.CatalogSearch
│       │   └── Datahub.Metadata
│       └── Datahub.Metadata
├── Datahub.CatalogSearch
├── Datahub.Core
├── Datahub.Infrastructure
│   ├── Datahub.Application
│   ├── Datahub.CatalogSearch
│   └── Datahub.Core
├── Datahub.Infrastructure.Offline
│   ├── Datahub.Application
│   └── Datahub.Core
├── Datahub.Metadata
└── Datahub.Portal.Metadata
    ├── Datahub.Application
    └── Datahub.Core
```

Also imports shared code via `Datahub.Shared.projitems` and `Desktop.SharedCode.projitems`.

---

## Azure Services

### Azure SQL Database

- Primary data store for the portal (Entity Framework Core with SQL Server provider)
- Source files:
  - `Portal/src/Datahub.Core/Data/EFTools.cs`
  - `Portal/src/Datahub.Core/Model/Context/SqlServerDatahubContext.cs`
  - `Portal/src/Datahub.Metadata/Model/SqlServerMetadataDbContext.cs`

### Azure Blob Storage

- Static documentation storage (docset container)
- Media file uploads and SAS URI generation
- Hosting request storage
- GC Notify template mappings
- Workspace file storage (upload, download, browse, search)
- Source files:
  - `Portal/src/Datahub.Portal/Services/StaticStorageReader.cs`
  - `Portal/src/Datahub.Portal/Controllers/MediaController.cs`
  - `Portal/src/Datahub.Portal/Controllers/HostingServicesController.cs`
  - `Portal/src/Datahub.Portal/Controllers/AzFileDownloadController.cs`
  - `Portal/src/Datahub.Infrastructure/Services/Storage/AzureCloudStorageManager.cs`
  - `Portal/src/Datahub.Infrastructure/Services/Notification/GCNotifyService.cs`
  - `Portal/src/Datahub.Core/Utils/BlobClientUtils.cs`
  - `Portal/src/Datahub.Core/Services/Docs/DocumentationService.cs`

### Azure Data Lake Storage Gen2

- Workspace file system operations (browse, upload, rename, delete, ACL management)
- Source files:
  - `Portal/src/Datahub.Infrastructure/Services/Storage/DataLakeClientService.cs`
  - `Portal/src/Datahub.Infrastructure/Services/Storage/AzureCloudStorageManager.cs`

### Azure Storage (Management Plane)

- Read and toggle `AllowSharedKeyAccess` on workspace storage accounts
- Source files:
  - `Portal/src/Datahub.Portal/Pages/Workspace/Settings/WorkspaceSharedKeyAccessControl.razor.cs`
  - `Portal/src/Datahub.Portal/Pages/Workspace/Storage/ResourcePages/UploaderCode.razor`
  - `Portal/src/Datahub.Portal/Pages/Workspace/Storage/ResourcePages/AzCopy.razor`
  - `Portal/src/Datahub.Infrastructure/Services/Storage/WorkspaceStorageManagementService.cs`

### Azure Storage Queues

- Health check connectivity verification for storage queues
- Source files:
  - `Portal/src/Datahub.Infrastructure/Services/Helpers/HealthCheckHelper.cs`

### Azure Key Vault

- Core secrets and keys management (portal-level)
- Workspace secrets and keys management (per-workspace key vaults)
- API token encryption/decryption (CryptographyClient)
- Health check validation (secret/key expiry)
- Source files:
  - `Portal/src/Datahub.Infrastructure/Services/Security/KeyVaultCoreService.cs`
  - `Portal/src/Datahub.Infrastructure/Services/Security/KeyVaultUserService.cs`
  - `Portal/src/Datahub.Infrastructure/Services/Helpers/HealthCheckHelper.cs`

### Azure App Service

- Web app lifecycle management (start, stop, restart)
- Application settings management (Key Vault references)
- Function app host key retrieval for health probing
- Source files:
  - `Portal/src/Datahub.Infrastructure/Services/WebApp/WorkspaceWebAppManagementService.cs`
  - `Portal/src/Datahub.Infrastructure/Services/Helpers/HealthCheckHelper.cs`
  - `Portal/src/Datahub.Portal/Pages/Workspace/Healthcheck/WorkspaceHealthcheckPage.razor`

### Azure Resource Manager (ARM)

- Subscription enumeration and verification
- Resource group management and listing
- Generic resource access via ArmClient
- Source files:
  - `Portal/src/Datahub.Infrastructure/Services/Subscriptions/DatahubAzureSubscriptionService.cs`
  - `Portal/src/Datahub.Infrastructure/Services/ResourceGroups/WorkspaceResourceGroupsManagementService.cs`
  - `Portal/src/Datahub.Infrastructure/Services/Helpers/HealthCheckHelper.cs`
  - `Portal/src/Datahub.Infrastructure/Services/Storage/WorkspaceStorageManagementService.cs`

### Azure Database for PostgreSQL Flexible Server

- Server resource metadata retrieval
- Firewall rule management (IP whitelisting)
- Source files:
  - `Portal/src/Datahub.Portal/Pages/Workspace/Database/WorkspaceDatabasePage.razor.cs`
  - `Portal/src/Datahub.Portal/Pages/Workspace/Database/DatabaseIpWhitelistTable.razor.cs`

### Azure Cost Management

- Workspace cost querying (daily costs by service)
- Budget management (consumption budgets)
- Source files:
  - `Portal/src/Datahub.Infrastructure/Services/Cost/WorkspaceCostManagementService.cs`
  - `Portal/src/Datahub.Infrastructure/Services/Cost/WorkspaceBudgetManagementService.cs`
  - `Portal/src/Datahub.Infrastructure/Services/Azure/AzureUsageService.cs`
  - `Portal/src/Datahub.Infrastructure/Services/Azure/CostManagementClasses.cs`

### Azure Service Bus

- Message transport for MassTransit (queue-based messaging between portal and serverless functions)
- Health check connectivity verification
- Source files:
  - `Portal/src/Datahub.Infrastructure/ConfigureServices.cs`
  - `Portal/src/Datahub.Infrastructure/Services/Helpers/HealthCheckHelper.cs`
  - `Portal/src/Datahub.Infrastructure/Queues/MessageHandlers/` (multiple senders)
  - `Portal/src/Datahub.Infrastructure/Services/ResourceMessagingService.cs`

### Azure Databricks

- Workspace health checks (instance availability, ACL status, cluster status)
- Token acquisition for Databricks API
- Source files:
  - `Portal/src/Datahub.Core/Utils/DatabricksClientUtils.cs`
  - `Portal/src/Datahub.Infrastructure/Services/Helpers/HealthCheckHelper.cs`
  - `Shared/src/Datahub.Shared/Services/AzAccessTokenManager.cs`

### Azure DevOps

- Token acquisition for DevOps API
- Work item tracking (bug reports, issues)
- Source files:
  - `Shared/src/Datahub.Shared/Services/AzAccessTokenManager.cs`
  - `Portal/src/Datahub.Infrastructure/ConfigureServices.cs` (AzureDevOpsClient registration)
  - `Portal/src/Datahub.Portal/Pages/Help/IssueForDisplaying.cs`

### Azure RBAC (Role Assignments)

- Assigning contributor roles to principals on web app resources
- Source files:
  - `Portal/src/Datahub.Portal/Pages/Workspace/Healthcheck/WorkspaceHealthcheckPage.razor`

### Azure Monitor / Application Insights

- Telemetry collection (events, exceptions, custom metrics)
- Log Analytics queries (LogsQueryClient)
- Source files:
  - `Portal/src/Datahub.Portal/Program.cs`
  - `Portal/src/Datahub.Portal/Startup.cs`
  - `Portal/src/Datahub.Infrastructure/Services/DatahubTelemetryAuditingService.cs`
  - `Portal/src/Datahub.Core/Services/Api/ApiTelemetryService.cs`
  - `Portal/src/Datahub.Core/Services/Api/ApplicationInsightsService.cs`

### Microsoft Graph

- User profile retrieval and management
- User existence verification
- Account status checks
- Source files:
  - `Portal/src/Datahub.Infrastructure/Services/UserManagement/MSGraphService.cs`
  - `Portal/src/Datahub.Infrastructure/Services/UserManagement/UserInformationService.cs`

---

## Required Azure Roles and API Permissions

### Azure RBAC Roles (for the service principal / managed identity)

- **Contributor** on workspace resource groups
  - Required for: App Service management, Storage account property updates, PostgreSQL firewall rules, resource group operations
- **Reader** on subscriptions
  - Required for: Subscription enumeration, resource group listing
- **Cost Management Reader** on subscriptions
  - Required for: Azure Cost Management queries, budget reads
- **Storage Blob Data Contributor** on workspace storage accounts
  - Required for: Blob/Data Lake file operations, SAS token generation
- **Azure Storage Queue permissions for AV flow (clamav-scan-result)**
  - Required: Managed identity authentication for all AV queue access.
  - Required: Storage Queue Data Message Processor role on the target storage queue for the AV consumer identity.
  - Required: Storage Queue Data Message Sender role on the target storage queue for the publisher identity.
  - Not allowed for runtime authentication: DatahubStorageQueue connection string and account-key based queue access.
  - NB: Storage Queue Data Contributor may be used instead of separate Sender and Processor roles. 
- **Storage Account Key Operator Service Role** on workspace storage accounts
  - Required for: Reading storage account keys for legacy access patterns
- **Key Vault Secrets Officer** on core and workspace key vaults
  - Required for: Secret CRUD operations, listing secrets
- **Key Vault Crypto Officer** on core key vault
  - Required for: Key read, encrypt/decrypt operations
- **User Access Administrator** on workspace web app resources
  - Required for: RBAC role assignments (assigning Contributor to principals)
- **Website Contributor** on workspace App Service resources
  - Required for: Start/stop/restart, application settings management, host key retrieval
- **Monitoring Reader** on Application Insights resources
  - Required for: Log Analytics queries

### Microsoft Graph API Permissions (Application)

- `Directory.Read.All` — Delegated, Admin consent required:Yes, read user profiles, check account status 
- `Directory.Read.All` — Application, Admin consent required:Yes, read user profiles, check account status 
- `email` - Delegated, Admin consent required:No
- `offline_access` - Delegated, Admin consent required:No
- `openid` - Delegated, Admin consent required:No
- `profile` - Delegated, Admin consent required:No
- `User.Invite.All` — Application, Admin consent required:Yes
- `User.Read` — Delegated, Admin consent required:No, read user profiles, check account status
- `User.Read.All` — Delegated, Admin consent required:Yes, read user profiles, check account status
- `User.Read.All` — Application, Admin consent required:Yes, read user profiles, check account status
- `User.ReadBasic.All` — Delegated, Admin consent required:No, read user profiles, check account status

### Azure Key Vault API Permissions (Application)

- `user_impersonation` - Delegated, Admin consent required:No, Have full access to the Azure Key Vault service

### Azure DevOps Permissions

- **Project Contributor** or **Work Item Administrator** on the Azure DevOps project
  - Required for: Work item creation (bug reports)
- **Build Reader** — pipeline listing

### Azure Resource Provider APIs Used

- `Microsoft.Sql` — Azure SQL Database
- `Microsoft.Storage` — Blob Storage, Data Lake Storage Gen2, Storage Queues, Storage account management
- `Microsoft.KeyVault` — Key Vault secrets, keys, cryptography
- `Microsoft.Web` — App Service, Azure Functions
- `Microsoft.Resources` — Resource groups, subscriptions
- `Microsoft.DBforPostgreSQL` — PostgreSQL Flexible Server
- `Microsoft.CostManagement` — Cost queries
- `Microsoft.Consumption` — Budget management
- `Microsoft.ServiceBus` — Service Bus messaging
- `Microsoft.Databricks` — Databricks workspace access (token-based)
- `Microsoft.Insights` — Application Insights, Log Analytics
- `Microsoft.Authorization` — Role assignments
- `Microsoft.Search` — Azure Cognitive Search

> This document was developed with the assistance of generative AI tools to support drafting, diagram generation and structuring activities. No Protected B or sensitive Government of Canada information was entered into these tools. All content has been reviewed, validated, and approved by the author to ensure accuracy, completeness, and compliance with Government of Canada security policies, standards, and applicable Treasury Board guidance.
