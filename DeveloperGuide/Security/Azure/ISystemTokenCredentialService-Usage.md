# ISystemTokenCredentialService — Usage Documentation

## Datahub.Shared

### Azure Resource Manager

- Token acquisition for `https://management.azure.com/.default` via infra credential
- Source files:
  - `Shared/src/Datahub.Shared/Services/AzAccessTokenManager.cs`

### Azure DevOps

- Token acquisition for DevOps API scope via infra credential
- Source files:
  - `Shared/src/Datahub.Shared/Services/AzAccessTokenManager.cs`

### Azure Databricks

- Token acquisition for Databricks workspace scope via default credential
- Source files:
  - `Shared/src/Datahub.Shared/Services/AzAccessTokenManager.cs`

## Portal — Datahub.Infrastructure

### Azure Key Vault

- Read secrets and keys from core and workspace key vaults
- Encrypt and decrypt API tokens using `CryptographyClient` (RSA-OAEP-256)
- Health-check secrets and keys (expiry validation, connectivity)
- Credentials used: default (KeyVaultCoreService, KeyVaultUserService), keyed "infra" (HealthCheckHelper)
- Source files:
  - `Portal/src/Datahub.Infrastructure/Services/Security/KeyVaultCoreService.cs`
  - `Portal/src/Datahub.Infrastructure/Services/Security/KeyVaultUserService.cs`
  - `Portal/src/Datahub.Infrastructure/Services/Helpers/HealthCheckHelper.cs`

### Azure App Service

- Start, stop, restart web apps
- Read and update application settings
- Retrieve Azure Function host keys for health probing
- Credential used: keyed "infra"
- Source files:
  - `Portal/src/Datahub.Infrastructure/Services/WebApp/WorkspaceWebAppManagementService.cs`
  - `Portal/src/Datahub.Infrastructure/Services/Helpers/HealthCheckHelper.cs`

### Azure Resource Manager (Subscriptions)

- List, verify, and fetch subscription resources
- Access resource groups
- Credential used: keyed "infra"
- Source files:
  - `Portal/src/Datahub.Infrastructure/Services/Subscriptions/DatahubAzureSubscriptionService.cs`
  - `Portal/src/Datahub.Infrastructure/Services/Helpers/HealthCheckHelper.cs`

### DI Registration

- Source files:
  - `Portal/src/Datahub.Infrastructure/Services/Security/ConfigureSecurityServices.cs`
  - `Portal/src/Datahub.Infrastructure/ConfigureServices.cs`

## Portal — Datahub.Portal (Blazor UI)

### Azure Storage (Management Plane)

- Read and toggle `AllowSharedKeyAccess` on storage accounts
- Check whether SAS token generation is available
- Credentials used: keyed "infra" (settings page), default (uploader/azcopy pages)
- Source files:
  - `Portal/src/Datahub.Portal/Pages/Workspace/Settings/WorkspaceSharedKeyAccessControl.razor.cs`
  - `Portal/src/Datahub.Portal/Pages/Workspace/Storage/ResourcePages/UploaderCode.razor`
  - `Portal/src/Datahub.Portal/Pages/Workspace/Storage/ResourcePages/AzCopy.razor`

### Azure Database for PostgreSQL Flexible Server

- Retrieve server resource metadata
- CRUD firewall rules (IP whitelist management)
- Credential used: keyed "infra"
- Source files:
  - `Portal/src/Datahub.Portal/Pages/Workspace/Database/WorkspaceDatabasePage.razor.cs`
  - `Portal/src/Datahub.Portal/Pages/Workspace/Database/DatabaseIpWhitelistTable.razor.cs`

### Azure App Service / Azure RBAC

- Read web app configuration
- Assign RBAC roles (Contributor) to principals on web app resources
- Credential used: default
- Source files:
  - `Portal/src/Datahub.Portal/Pages/Workspace/Healthcheck/WorkspaceHealthcheckPage.razor`

## ResourceProvisioner.Infrastructure

### Azure Resource Manager

- Management API token acquisition via `AzAccessTokenManager`
- Credential used: infra (uses `AzureDevOpsConfiguration` credentials)
- Source files:
  - `ResourceProvisioner/src/ResourceProvisioner.Infrastructure/Services/InfraTokenCredentialService.cs`
  - `ResourceProvisioner/src/ResourceProvisioner.Infrastructure/ConfigureServices.cs`

### Azure DevOps

- DevOps API token acquisition via `AzAccessTokenManager`
- Source files:
  - `ResourceProvisioner/src/ResourceProvisioner.Infrastructure/Services/InfraTokenCredentialService.cs`
  - `ResourceProvisioner/src/ResourceProvisioner.Infrastructure/ConfigureServices.cs`

### Azure Databricks

- Databricks workspace token acquisition via `AzAccessTokenManager`
- Source files:
  - `ResourceProvisioner/src/ResourceProvisioner.Infrastructure/Services/InfraTokenCredentialService.cs`
  - `ResourceProvisioner/src/ResourceProvisioner.Infrastructure/ConfigureServices.cs`

## Test Projects (mocked only)

### Datahub.Functions.UnitTests

- `ISystemTokenCredentialService` is substituted to construct `AzAccessTokenManager` in test setup
- Source files:
  - `ServerlessOperations/test/Datahub.Functions.UnitTests/Functions/HealthCheckFunctionTests.cs`
  - `ServerlessOperations/test/Datahub.Functions.UnitTests/Functions/ConfigureWorkspaceAppServiceTests.cs`
  - `ServerlessOperations/test/Datahub.Functions.UnitTests/Functions/CheckInfrastructureStatusTests.cs`
  - `ServerlessOperations/test/Datahub.Functions.UnitTests/Functions/BugReportTests.cs`

### Datahub.SpecflowTests

- `ISystemTokenCredentialService` is stubbed/substituted for integration test service setup
- Source files:
  - `Portal/test/Datahub.SpecflowTests/Steps/Workspace/WorkspaceSettingsSteps.cs`
  - `Portal/test/Datahub.SpecflowTests/Hooks/WorkspaceSubscriptionHook.cs`
  - `Portal/test/Datahub.SpecflowTests/Hooks/DatahubAzureSubscriptionHook.cs`

> This document was developed with the assistance of generative AI tools to support drafting, diagram generation and structuring activities. No Protected B or sensitive Government of Canada information was entered into these tools. All content has been reviewed, validated, and approved by the author to ensure accuracy, completeness, and compliance with Government of Canada security policies, standards, and applicable Treasury Board guidance.