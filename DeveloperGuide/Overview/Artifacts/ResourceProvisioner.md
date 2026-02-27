# Resource Provisioner – Overview

## Purpose

The Resource Provisioner subsystem automates creation and updates of cloud infrastructure for Datahub workspaces using Terraform and Git-based workflows.

At a high level, it:
- Receives provisioning requests (via API and Azure Service Bus)
- Validates and normalizes request data.
- Updates infrastructure-as-code repositories (Terraform templates, variables).
- Opens or updates pull requests against the infrastructure repository.
- Exposes status and events for other systems.

## Solution Structure

- `ResourceProvisioner.Domain`  
  Core domain models and value objects (e.g., `TerraformWorkspace`, `TerraformTemplate`, `PullRequestValueObject`, `RepositoryUpdateEvent`).

- `ResourceProvisioner.Application`  
  Application layer, commands, queries, validators, and orchestrations (e.g., `CreateResourceRunCommand`, `CreateResourceRunCommandValidator`).

- `ResourceProvisioner.Infrastructure`  
  Implementations that talk to Git/Azure DevOps/GitHub, Terraform, storage, etc. (e.g., `RepositoryService` implementing `IRepositoryService`).

- `ResourceProvisioner.API`  
  HTTP API entry points for initiating provisioning or querying status.

- `ResourceProvisioner.Functions`  
  Azure Functions used for asynchronous processing and integration (Service Bus triggers, timers, etc.).

---

## Key Concepts

### TerraformWorkspace

Represents a logical workspace whose infrastructure is managed by Terraform.

Key properties:
- `Name`, `Acronym`
- `SubscriptionId`
- `Version`
- `BudgetAmount`
- `StorageSizeLimitInTB`
- `TerraformOrganization`
- `Users` (and helpers like `ToUserList(...)`)
- `SSCCBRID`

Purpose:
- Encapsulates configuration/state for a provisioned workspace.
- Provides helper methods for serializing user lists to JSON (`JsonNode`).

### TerraformTemplate

Represents an individual Terraform template to be executed as part of a resource run.

Key members:
- Constants like:
  - `NewProjectTemplate`
  - `VariableUpdate`
  - `AzureStorageBlob`, `AzureDatabricks`, `AzureVirtualMachine`, `AzureAppService`, `AzurePostgres`, `AzureArcGis`, `AzureAPI`, etc.
- Constructors for deserialization and internal use.
- Properties:
  - `Name`
  - `Status`
  - `RequestedAt`
- Utility methods:
  - `ConvertTemplateNameToReadableName(...)`
  - `NormalizeTemplateName(...)`
  - `GetDependencyNames(...)`
  - `GetDependenciesToCreate(...)`
  - `MapHealthResourceTypeToTemplateConstant(...)`

Purpose:
- Models each infrastructure component requested (e.g., “new project”, “new Azure storage account”).
- Provides helpers to translate template names to user‑friendly labels and to infer dependencies.

### CreateResourceRunCommand

Application command representing a request to execute a “resource run”.

Properties:
- `List<TerraformTemplate> Templates`
- `TerraformWorkspace Workspace`
- `WorkspaceAppData AppData`
- `string RequestingUserEmail`
- `string ResourceGroupName`
- `bool UpdateWorkspaceVersion`

Purpose:
- DTO used to carry all information needed to apply requested infrastructure changes.
- Validated by `CreateResourceRunCommandValidator` to ensure request integrity.

---

## Repository and Pull Request Workflow

### IRepositoryService

The main abstraction for repository operations and Terraform execution.

Key methods:
- `FetchModuleRepository(string version)`
- `FetchInfrastructureRepository()`
- `CheckoutInfrastructureBranch(string workspaceName)`
- `CommitTerraformTemplate(TerraformTemplate template, string username)`
- `PushInfrastructureRepository(string workspaceAcronym)`
- `Task<PullRequestValueObject> CreateInfrastructurePullRequest(string workspaceAcrynom)`
- `FetchRepositoriesAndCheckoutProjectBranch(TerraformWorkspace workspace)`
- `ExecuteResourceRuns(CreateResourceRunCommand command, string username)`
- `ExecuteResourceRun(TerraformTemplate resourceTemplate, CreateResourceRunCommand command, string username)`
- `HandleResourcing(CreateResourceRunCommand command)`

Purpose:
- Encapsulates all Git/Terraform interactions required for a resource run.
- Fetches/clones repositories, creates or checks out appropriate branches.
- Applies Terraform template updates and commits them.
- Pushes changes and opens pull requests for review and deployment.

### PullRequestUpdateMessage and PullRequestValueObject

- `PullRequestUpdateMessage` extends `BaseUpdateMessage`, holding:
  - `PullRequestValueObject? PullRequestValueObject`
- `PullRequestValueObject`:
  - `WorkspaceAcronym`
  - `Url`
  - `PullRequestId`

Purpose:
- Represent the outcome of repository updates in a transport‑friendly format.
- Provide consumers with a link and ID to the created/updated pull request.

---

## Azure Functions

### ResourceRunRequest Function

**File:** `ResourceProvisioner.Functions/ResourceRunRequest.cs`  
**Trigger:** `ServiceBusTrigger` on queue `ResourceRunRequestQueueName`  
**Purpose:**  
Process resource run requests enqueued on Azure Service Bus.

**Flow:**

1. Log basic metadata about the received `ServiceBusReceivedMessage`:
   - `MessageId`
   - `DeliveryCount`
   - `EnqueuedTime`
   - Raw body (for diagnostics).

2. Deserialize the message envelope:
   - Parse body as JSON (`JsonDocument.ParseAsync`).
   - Read nested `message` property.
   - Deserialize to `CreateResourceRunCommand` using case‑insensitive property matching.

3. Validate the command:
   - Instantiate `CreateResourceRunCommandValidator`.
   - Run `ValidateAsync(resourceRun)`.
   - If invalid, log validation errors and throw `FluentValidation.ValidationException`.

4. Handle the resource run:
   - Call `repositoryService.HandleResourcing(resourceRun)`.
   - `HandleResourcing` is responsible for:
     - Fetching repositories.
     - Applying requested Terraform templates.
     - Committing and pushing changes.
     - Creating or updating an infrastructure pull request.
   - Log success with details from `PullRequestUpdateMessage`.

5. Error handling:
   - Catch any exception, log with `LogError`, then rethrow so the Azure Functions runtime can handle retries / dead-lettering.

## End-to-End Resource Run

1. **Request Origin**
   - API or another component creates and enqueues a `CreateResourceRunCommand` (wrapped in a `message` envelope) to the `ResourceRunRequest` Service Bus queue.

2. **Message Processing**
   - `ResourceRunRequest` Azure Function picks up the message and validates it.

3. **Repository Operations**
   - `IRepositoryService` implementation:
     - Fetches / updates Terraform modules (`FetchModuleRepository`).
     - Fetches the main infrastructure repo (`FetchInfrastructureRepository`).
     - Checks out appropriate branch (`CheckoutInfrastructureBranch` / `FetchRepositoriesAndCheckoutProjectBranch`).
     - Applies each `TerraformTemplate` via `ExecuteResourceRuns` or `ExecuteResourceRun`.
     - Commits and pushes changes (`CommitTerraformTemplate`, `PushInfrastructureRepository`).

4. **Pull Request Creation**
   - A pull request is created (`CreateInfrastructurePullRequest`).
   - Result is wrapped in `PullRequestUpdateMessage`, including:
     - Workspace acronym.
     - Pull request URL and ID.

5. **Downstream Consumption**
   - Callers / UIs can present PR details, or follow up with integration pipelines to apply infrastructure.

---

## Extending Resource Provisioner

To add a new resource type:

1. Add a new constant in `TerraformTemplate` (e.g., `public const string AzureRedisCache = "azure-redis-cache";`).
2. Implement mapping and display logic in `ConvertTemplateNameToReadableName*` and `MapHealthResourceTypeToTemplateConstant`.
3. Implement infrastructure logic in `IRepositoryService` implementation to:
   - Update/create the appropriate Terraform `.tf` files.
   - Wire it into `ExecuteResourceRun`/`ExecuteResourceRuns`.
4. Update validators (e.g., `CreateResourceRunCommandValidator`) to handle any new required fields in `WorkspaceAppData` or templates.
5. Optionally add a new API endpoint or message producer to create the new template type.
