# ResourceProvisioner.Functions — External Services Summary

This document lists all external services consumed by the ResourceProvisioner.Functions Azure Function app and its transitive project dependencies.

## Dependency Tree

```
ResourceProvisioner.Functions
├── ResourceProvisioner.Application
│   └── ResourceProvisioner.Domain
│       └── Datahub.Shared (shared project items)
└── ResourceProvisioner.Infrastructure
    └── ResourceProvisioner.Application (see above)
```

`ResourceProvisioner.Domain` imports `Datahub.Shared.projitems` for shared types and interfaces.

---

## Azure Services

### Azure Service Bus

- Trigger source: the function is triggered by messages on the `resource-run-request` queue
- Transport layer for MassTransit consumers
- Source files:
  - `ResourceProvisioner/src/ResourceProvisioner.Functions/ResourceRunRequest.cs`
  - `ResourceProvisioner/src/ResourceProvisioner.Functions/Program.cs`

### Azure DevOps (REST API)

- Git repository operations authenticated via Azure DevOps OAuth tokens
- Pull request creation (POST to Azure DevOps Repos API)
- Pull request auto-approval/completion (PATCH to Azure DevOps Repos API)
- Existing pull request lookup (GET from Azure DevOps Repos API)
- Work item tracking client (via `AzureDevOpsClient` → `WorkItemTrackingHttpClient`)
- Pipeline client (HTTP with Bearer token)
- Source files:
  - `ResourceProvisioner/src/ResourceProvisioner.Infrastructure/Services/RepositoryService.cs`
  - `ResourceProvisioner/src/ResourceProvisioner.Infrastructure/ConfigureServices.cs`
  - `Shared/src/Datahub.Shared/Clients/AzureDevOpsClient.cs`
  - `Shared/src/Datahub.Shared/Services/AzAccessTokenManager.cs`

### Azure DevOps (Git via LibGit2Sharp)

- Clone infrastructure and module repositories
- Branch creation and checkout
- Pull (fetch upstream changes)
- Stage, commit, and push changes
- SSL certificate validation with configurable issuer
- Source files:
  - `ResourceProvisioner/src/ResourceProvisioner.Infrastructure/Services/RepositoryService.cs`

### Microsoft Entra ID (Azure AD)

- Service principal authentication via `ClientSecretCredential` for Azure DevOps token acquisition
- Token scopes: Azure DevOps (`499b84ac-1321-427f-aa17-267ca6975798/.default`), Azure Management API, Databricks
- Source files:
  - `ResourceProvisioner/src/ResourceProvisioner.Infrastructure/Services/InfraTokenCredentialService.cs`
  - `Shared/src/Datahub.Shared/Services/AzAccessTokenManager.cs`

---

## Internal Infrastructure

### MassTransit (over Azure Service Bus)

- Consumer registration for processing resource run request messages
- Configured with Azure Functions Worker integration (`MassTransit.WebJobs.ServiceBus`)
- Source files:
  - `ResourceProvisioner/src/ResourceProvisioner.Functions/Program.cs`
  - `ResourceProvisioner/src/ResourceProvisioner.Functions/ResourceRunRequest.cs`

### Terraform (file-based IaC generation)

- Template copying from module repository to workspace project directory
- Variable extraction and `.auto.tfvars.json` file generation
- Backend configuration file generation (`.tfbackend`)
- Template deletion and workspace deletion script generation
- No direct Terraform CLI execution — generates files for downstream pipeline consumption
- Source files:
  - `ResourceProvisioner/src/ResourceProvisioner.Infrastructure/Services/TerraformService.cs`

---

## Summary of Workflow

1. A `WorkspaceDefinition` message arrives on the Azure Service Bus queue
2. The function validates the message and delegates to `IRepositoryService.HandleResourcing`
3. The repository service:
   - Clones the module repository (public Git, tagged by version)
   - Clones the infrastructure repository (Azure DevOps Git, authenticated)
   - Checks out or creates a workspace branch
   - Copies Terraform templates and extracts variables
   - Commits and pushes changes
   - Creates and auto-approves a pull request via Azure DevOps REST API
4. The merged PR triggers a downstream Azure DevOps pipeline that runs `terraform apply`

---

## Required Azure Roles and API Permissions

### Azure RBAC Roles (for the Function App managed identity / service principal)

- No direct Azure resource management roles required
  - This function does not interact with Azure resources directly; it generates Terraform files and delegates to Azure DevOps pipelines

### Microsoft Entra ID (Azure AD) Permissions

- Application registration with `ClientSecretCredential`
  - Required for: Acquiring Azure DevOps access tokens (scope `499b84ac-1321-427f-aa17-267ca6975798/.default`)

### Azure DevOps Permissions

- **Code Contributor** on the infrastructure repository
  - Required for: Clone, branch, commit, push operations via Git
- **Pull Request Contributor** on the infrastructure repository
  - Required for: Creating and completing pull requests via REST API
- **Build Reader** (optional, for pipeline client)
  - Required for: Pipeline listing and triggering if used

### Azure Resource Provider APIs Used

- `Microsoft.ServiceBus` — Service Bus messaging (trigger source)
- No other Azure Resource Provider APIs are called directly; all infrastructure provisioning is delegated to Terraform via Azure DevOps pipelines

> This document was developed with the assistance of generative AI tools to support drafting, diagram generation and structuring activities. No Protected B or sensitive Government of Canada information was entered into these tools. All content has been reviewed, validated, and approved by the author to ensure accuracy, completeness, and compliance with Government of Canada security policies, standards, and applicable Treasury Board guidance.