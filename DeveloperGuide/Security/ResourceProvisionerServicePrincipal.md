# ResourceRunRequest Service Principal Usage

## Overview

`ResourceRunRequest` receives a Service Bus message and delegates processing to `IRepositoryService.HandleResourcing`. The service principal is used downstream, when the repository processing performs Azure DevOps operations.

## Execution flow

- Entry point and delegation: [ResourceProvisioner.Functions/ResourceRunRequest.cs](../src/ResourceProvisioner.Functions/ResourceRunRequest.cs#L16-L49)
- Repository processing entry: [ResourceProvisioner.Infrastructure/Services/RepositoryService.cs](../src/ResourceProvisioner.Infrastructure/Services/RepositoryService.cs#L150-L329)

## Azure DevOps service principal credentials

Azure DevOps authentication is configured under `InfrastructureRepository:AzureDevOpsConfiguration`.

- `TenantId`
- `ClientId`
- `ClientSecret`

## Downstream service principal usage (Azure DevOps)

### Azure DevOps Git operations (clone, pull, push) and pull requests (create, auto-approve, fetch existing)

Repository operations use Azure DevOps Git endpoints via libgit2 (`Repository.Clone`, `Commands.Pull`, `repo.Network.Push`).

- Where it happens:
  - [FetchInfrastructureRepository](../src/ResourceProvisioner.Infrastructure/Services/RepositoryService.cs#L151-L178)
  - [CheckoutInfrastructureBranch](../src/ResourceProvisioner.Infrastructure/Services/RepositoryService.cs#L184-L226)
  - [PushInfrastructureRepository](../src/ResourceProvisioner.Infrastructure/Services/RepositoryService.cs#L261-L286)
  - [CreateInfrastructurePullRequest](../src/ResourceProvisioner.Infrastructure/Services/RepositoryService.cs#L291-L329)
  - [SendAutoApprovePatchRequestAsync](../src/ResourceProvisioner.Infrastructure/Services/RepositoryService.cs#L351-L356)
  - [GetExistingPullRequestId](../src/ResourceProvisioner.Infrastructure/Services/RepositoryService.cs#L531-L538)
- How credentials are applied:
  - An access token is created using `ClientSecretCredential` in [Datahub.Shared/Clients/AzureDevOpsClient.cs](../../Shared/src/Datahub.Shared/Clients/AzureDevOpsClient.cs#L51-L78)
  - The service principal identity/secret come from `InfrastructureRepository:AzureDevOpsConfiguration` in [ResourceProvisioner/template.settings.json](../template.settings.json#L25-L28)

## Non-service-principal credential usage in ResourceRunRequest

The Service Bus trigger uses a connection string (not a service principal).

- Trigger attribute: [ResourceProvisioner.Functions/ResourceRunRequest.cs](../src/ResourceProvisioner.Functions/ResourceRunRequest.cs#L17-L19)
- Configuration source: [ResourceProvisioner/template.settings.json](../template.settings.json#L5-L7)
