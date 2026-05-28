# Datahub.Functions — External Services Summary

The function acts as the async processing backbone, consuming messages from Azure Service Bus and interacting with Azure Cost Management, Microsoft Graph, Azure DevOps, Blob/Table Storage, SMTP, GC Notify, and Teams webhooks.

This document lists all external services consumed by the Datahub.Functions Azure Function app and its transitive project dependencies.

## Dependency Tree

```
Datahub.Functions
├── Datahub.Core (Portal shared library)
│   ├── Datahub.Markdown
│   ├── Datahub.CatalogSearch
│   │   └── Datahub.Metadata
│   └── Datahub.Metadata
├── Datahub.Infrastructure (Portal infrastructure library)
│   ├── Datahub.Application
│   ├── Datahub.CatalogSearch
│   └── Datahub.Core
└── Datahub.Functions.Domain (lightweight domain exceptions)
```

Datahub.Functions reuses the Portal's `Datahub.Core` and `Datahub.Infrastructure` projects directly, inheriting their service implementations.

---

## Azure Services

### Azure Service Bus

- Primary trigger source for most functions (ServiceBusTrigger bindings)
- Message transport for MassTransit (publishing follow-up messages to other queues)
- Queues consumed:
  - `bug-report` — bug report processing
  - `email-notification` — email dispatch
  - `terraform-output-handler` — Terraform pipeline output processing
  - `infrastructure-health-check` — health check execution
  - `infrastructure-health-check-results` — health check result persistence
  - `project-usage-update` — workspace cost updates
  - `project-capacity-update` — workspace storage capacity updates
  - `project-inactivity-notification` — project inactivity alerts
  - `user-inactivity-notification` — user inactivity alerts
  - `workspace-app-service-configuration` — app service pipeline triggering
  - `virus-scan-notification` — virus scan result notifications
- Source files:
  - All function files (ServiceBusTrigger attributes)
  - `ServerlessOperations/src/Datahub.Functions/Program.cs`

### Azure SQL Database

- Primary data store (Entity Framework Core with SQL Server provider)
- Project metadata, resources, costs, health checks, user data, notifications
- Source files:
  - `ServerlessOperations/src/Datahub.Functions/Program.cs`
  - `ServerlessOperations/src/Datahub.Functions/TerraformOutputHandler.cs`
  - `ServerlessOperations/src/Datahub.Functions/RecordInfrastructureStatus.cs`
  - `ServerlessOperations/src/Datahub.Functions/ProjectUsageScheduler.cs`
  - `ServerlessOperations/src/Datahub.Functions/ProjectInactivityNotifier.cs`
  - `ServerlessOperations/src/Datahub.Functions/UserInactivityNotifier.cs`
  - `ServerlessOperations/src/Datahub.Functions/InactivityScheduler.cs`

### Azure Blob Storage

- Cost data upload and download (costs container)
- Source files:
  - `ServerlessOperations/src/Datahub.Functions/ProjectUsageUpdater.cs`
  - `ServerlessOperations/src/Datahub.Functions/ProjectUsageScheduler.cs`

### Azure Table Storage

- Alert deduplication (ReceivedAlerts table)
- Bug report message persistence (BugReportMessages table)
- Source files:
  - `ServerlessOperations/src/Datahub.Functions/Services/AlertRecordService.cs`

### Azure Key Vault

- Secret retrieval for core configuration (via `KeyVaultCoreService` from Datahub.Infrastructure)
- Source files:
  - `ServerlessOperations/src/Datahub.Functions/Program.cs` (registers `IKeyVaultCoreService`)

### Azure Cost Management

- Subscription cost querying (daily and total granularity)
- Budget management (get/set workspace budget amounts, rollover)
- Source files:
  - `ServerlessOperations/src/Datahub.Functions/ProjectUsageScheduler.cs`
  - `ServerlessOperations/src/Datahub.Functions/ProjectUsageUpdater.cs`
  - Via `IWorkspaceCostManagementService` and `IWorkspaceBudgetManagementService` from Datahub.Infrastructure

### Azure Resource Manager (ARM)

- Resource group enumeration per subscription
- Storage account capacity queries
- Source files:
  - `ServerlessOperations/src/Datahub.Functions/ProjectUsageScheduler.cs`
  - Via `IWorkspaceResourceGroupsManagementService` and `IWorkspaceStorageManagementService` from Datahub.Infrastructure

### Azure App Service

- Web app management (start/stop/restart, app settings)
- Source files:
  - `ServerlessOperations/src/Datahub.Functions/Program.cs` (registers `IWorkspaceWebAppManagementService`)

### Azure DevOps

- Work item creation (bug reports → Issues in Azure Boards)
- Pipeline triggering (app service configuration pipelines)
- Token acquisition for DevOps API
- Source files:
  - `ServerlessOperations/src/Datahub.Functions/BugReport.cs`
  - `ServerlessOperations/src/Datahub.Functions/ConfigureWorkspaceAppService.cs`
  - `Shared/src/Datahub.Shared/Clients/AzureDevOpsClient.cs`

### Microsoft Graph

- User invitation (B2B guest invitations)
- Group membership management (add users to service principal group)
- User status queries (locked accounts, group members)
- Source files:
  - `ServerlessOperations/src/Datahub.Functions/CreateGraphUser.cs`
  - `ServerlessOperations/src/Datahub.Functions/GetUsersStatus.cs`

### Azure Storage Queues

- Health check connectivity verification (via `HealthCheckHelper` from Datahub.Infrastructure)
- Source files:
  - Via `HealthCheckHelper` in `ServerlessOperations/src/Datahub.Functions/CheckInfrastructureStatus.cs`

### Azure Databricks

- Health check (instance availability, ACL, cluster status via `HealthCheckHelper`)
- Source files:
  - Via `HealthCheckHelper` in `ServerlessOperations/src/Datahub.Functions/CheckInfrastructureStatus.cs`

## Function Inventory

- **BugReport** — Service Bus trigger, creates Azure DevOps work items, posts to Teams, sends GC Notify emails
- **CheckInfrastructureStatus** — Timer + Service Bus + HTTP triggers, runs health checks across all Azure services
- **ConfigureWorkspaceAppService** — Service Bus trigger, triggers Azure DevOps pipelines for app service configuration
- **CreateGraphUser** — HTTP trigger, invites users via Microsoft Graph, manages group membership
- **DocumentationRankUpdate** — updates documentation search rankings
- **EmailNotificationHandler** — Service Bus trigger, sends emails via SMTP (MailKit)
- **FunctionsHealthCheck** — HTTP trigger, validates GC Notify connectivity
- **GetUsersStatus** — HTTP trigger, queries Microsoft Graph for locked users and group members
- **InactivityScheduler** — Timer trigger, schedules project and user inactivity checks
- **ProjectInactiveHandler** — handles project soft-deletion
- **ProjectInactivityNotifier** — Service Bus trigger, sends inactivity warnings via GC Notify
- **ProjectUsageNotifier** — Service Bus trigger, sends cost/usage alerts
- **ProjectUsageScheduler** — Timer + HTTP triggers, queries Azure Cost Management, uploads to Blob, dispatches update messages
- **ProjectUsageUpdater** — Service Bus trigger, downloads costs from Blob, updates database, handles budget rollover
- **RecordInfrastructureStatus** — Service Bus + HTTP triggers, persists health check results to SQL
- **TerraformOutputHandler** — Service Bus trigger, processes Terraform pipeline outputs, updates project resources in SQL
- **UserInactivityNotifier** — Service Bus trigger, sends user lock/deletion warnings via GC Notify, disables users
- **VirusScanNotificationHandler** — Service Bus trigger, creates system notifications for virus scan results
- **VirusScanUserStatusHandler** — handles user-facing virus scan status updates

---

## Required Azure Roles and API Permissions

### Azure RBAC Roles (for the Function App managed identity / service principal)

- **Contributor** on workspace resource groups
  - Required for: App Service management, resource group operations, storage capacity queries
- **Reader** on subscriptions
  - Required for: Subscription enumeration, resource group listing
- **Cost Management Reader** on subscriptions
  - Required for: Azure Cost Management queries (daily/total costs)
- **Cost Management Contributor** on subscriptions
  - Required for: Budget amount updates (rollover operations)
- **Storage Blob Data Contributor** on the costs storage account
  - Required for: Uploading/downloading cost data blobs
- **Storage Table Data Contributor** on the functions storage account
  - Required for: Alert deduplication table, bug report message table
- **Storage Queue Data Reader** on storage queues
  - Required for: Health check queue connectivity verification
- **Key Vault Secrets User** on core key vault
  - Required for: Reading secrets for configuration
- **Website Contributor** on workspace App Service resources
  - Required for: Start/stop/restart, application settings management
- **Monitoring Reader** on Application Insights / Log Analytics
  - Required for: Health check queries

### Microsoft Graph API Permissions (Application)

- `User.Invite.All` — send B2B guest invitations
- `User.Read.All` — read user profiles, check locked status
- `GroupMember.ReadWrite.All` — add users to security groups
- `Directory.Read.All` — directory object lookups

### Azure DevOps Permissions

- **Project Contributor** or **Work Item Administrator** on the Azure DevOps project
  - Required for: Work item creation (bug reports → Issues)
- **Build Administrator** or **Pipeline Runner**
  - Required for: Listing and triggering pipelines (app service configuration)

### Azure Resource Provider APIs Used

- `Microsoft.Sql` — Azure SQL Database
- `Microsoft.Storage` — Blob Storage, Table Storage, Storage Queues
- `Microsoft.KeyVault` — Key Vault secrets
- `Microsoft.Web` — App Service management
- `Microsoft.Resources` — Resource groups, subscriptions
- `Microsoft.CostManagement` — Cost queries
- `Microsoft.Consumption` — Budget management
- `Microsoft.ServiceBus` — Service Bus messaging (trigger + send)
- `Microsoft.Databricks` — Databricks health checks (token-based)
- `Microsoft.Insights` — Application Insights health checks
- `Microsoft.Authorization` — Role assignment reads (health checks)

> This document was developed with the assistance of generative AI tools to support drafting, diagram generation and structuring activities. No Protected B or sensitive Government of Canada information was entered into these tools. All content has been reviewed, validated, and approved by the author to ensure accuracy, completeness, and compliance with Government of Canada security policies, standards, and applicable Treasury Board guidance.