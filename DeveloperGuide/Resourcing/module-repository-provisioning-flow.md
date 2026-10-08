# Module repository provisioning flow

This document describes how the Resource Provisioner uses the module repository as the source of Terraform templates and how those files are merged into the per-workspace infrastructure repository that eventually becomes an Azure DevOps pull request.

The runtime logic is implemented primarily in:

- `ResourceProvisioner.Infrastructure.Services.RepositoryService`
- `ResourceProvisioner.Infrastructure.Services.TerraformService`
- `ResourceProvisioner.Infrastructure.Common.DirectoryUtils`
- `ResourceProvisioner.Application.Config.ResourceProvisionerConfiguration`

## Repository roles

### Module repository
The module repository is the template source.

Configuration values are read from `ResourceProvisionerConfiguration.ModuleRepository`:

- `Url` – Git repo URL for Terraform modules/templates
- `LocalPath` – local temp path used for cloning
- `TemplatePathPrefix` – where template folders live (for example `templates/`)
- `ModulePathPrefix` – where reusable module folders live (for example `modules/`)
- `Branch` – repo branch used for version mapping

The module repo is cloned into a temporary working directory and checked out to a versioned ref such as:

- `dev-1.2.3`
- or the default `main` branch if the matching tag/branch is missing.

### Project infrastructure repository
The infrastructure repository is the workspace state repo.

Configuration values are read from `ResourceProvisionerConfiguration.InfrastructureRepository`:

- `Url` – Azure DevOps Git repo URL
- `LocalPath` – temp path for local clone
- `Name` – repo name, such as `datahub-project-infrastructure-dev`
- `ProjectPathPrefix` – folder under the repo that holds per-workspace Terraform projects, such as `terraform/projects`
- `MainBranch` – target branch for pull requests, such as `main`
- `PullRequestUrl` / `PullRequestBrowserUrl` – Azure DevOps PR API endpoints

This repo is cloned once, then a workspace branch is created or reset before committing generated Terraform files.

## High-level provisioning flow

```mermaid
flowchart TD
    A[Service Bus message with WorkspaceDefinition] --> B[ResourceRunRequest]
    B --> C[RepositoryService.HandleResourcing]
    C --> D[FetchRepositoriesAndCheckoutProjectBranch]

    D --> E[FetchModuleRepository]
    E --> F[Clone module repository]
    F --> G[Checkout tag/branch for workspace version]

    D --> H[FetchInfrastructureRepository]
    H --> I[Clone project infrastructure repository]
    I --> J[CheckoutInfrastructureBranch]
    J --> K[Create or reset workspace branch]

    C --> L[ExecuteResourceRuns]
    L --> M[For each template: ExecuteResourceRun]
    M --> N[TerraformService.CopyTemplateAsync]
    N --> O[Read template files from module repo]
    O --> P[Write generated Terraform files to project repo]
    P --> Q[ExtractVariables / ExtractBackendConfig]
    Q --> R[CommitTerraformTemplate]
    R --> S[PushInfrastructureRepository]
    S --> T[CreateInfrastructurePullRequest]
    T --> U[Azure DevOps PR opened for workspace branch]
```

## Detailed runtime sequence

```mermaid
sequenceDiagram
    participant Queue as Service Bus / Azure Function
    participant Repo as RepositoryService
    participant Mod as Module repo
    participant Infra as Infrastructure repo
    participant TF as TerraformService
    participant ADO as Azure DevOps

    Queue->>Repo: HandleResourcing(workspaceDefinition)
    Repo->>Repo: Create temp working directory
    Repo->>Mod: FetchModuleRepository(workspaceVersion)
    Mod-->>Repo: Clone repository
    Repo->>Repo: Checkout ref using pattern: {branch}-{version}

    Repo->>Infra: FetchInfrastructureRepository()
    Infra-->>Repo: Clone project repo
    Repo->>Infra: CheckoutInfrastructureBranch(workspaceAcronym)
    Infra-->>Repo: Workspace branch created or reset to main

    Repo->>Repo: ExecuteResourceRuns(workspaceDefinition)
    loop for each Terraform template
        Repo->>TF: CopyTemplateAsync(templateName, workspaceDefinition)
        TF->>Mod: Read template source files
        TF->>Infra: Copy files into terraform/projects/<workspaceAcronym>
        TF->>TF: Replace {{tag}} and {{version}} placeholders
        Repo->>TF: ExtractVariables(templateName, workspaceDefinition)
        Repo->>TF: ExtractBackendConfig(workspaceAcronym)
        Repo->>Infra: git commit generated files
    end

    Repo->>Infra: git push workspace branch
    Repo->>ADO: Create PR from workspace branch to main
    ADO-->>Repo: PR id, URL, createdBy id
    Repo-->>Queue: PullRequestUpdateMessage
```

## How template files are copied

The project infrastructure repository is not authored directly from scratch. Instead, the module repository provides a template source tree and the provisioner copies selected files into the workspace project path.

```mermaid
flowchart LR
    subgraph ModuleRepo[Module repository]
        A1[templates/new-project-template]
        A2[templates/azure-storage-blob]
        A3[templates/azure-app-service]
        A4[modules/]
    end

    subgraph InfraRepo[Infrastructure repository]
        B1[terraform/projects/<workspaceAcronym>]
        B2[project.tfbackend]
        B3[*.auto.tfvars.json]
        B4[workspace branch <workspaceAcronym>]
    end

    A1 -->|CopyTemplateAsync| B1
    A2 -->|CopyTemplateAsync| B1
    A3 -->|CopyTemplateAsync| B1
    A4 -->|module references| B1

    B1 --> B2
    B1 --> B3
    B4 -->|PR target| main
```

The actual path resolution happens in `DirectoryUtils`:

- `GetTemplatePath` -> module repo + `ModuleRepository.TemplatePathPrefix` + template name
- `GetProjectPath` -> infrastructure repo + `InfrastructureRepository.ProjectPathPrefix` + workspace acronym

This is why the module repo acts as a source library and the infrastructure repo becomes the long-lived project state repo.

## Variable and backend generation

After template files are copied, Terraform variables are generated for the workspace.

```mermaid
flowchart TD
    A[WorkspaceDefinition + AppData] --> B[TerraformService.ExtractVariables]
    B --> C{Template type}
    C -->|new-project-template| D[Write generated backend config]
    C -->|other templates| E[Write .auto.tfvars.json values]
    D --> F[terraform/projects/<workspaceAcronym>/project.tfbackend]
    E --> G[terraform/projects/<workspaceAcronym>/<template>.auto.tfvars.json]
```

Important steps:

- `TerraformService.CopyTemplateAsync` reads each file from the module repo template folder.
- It replaces placeholders such as:
  - `{{tag}}` -> `?ref={branch}-{workspace.version}`
  - `{{version}}` -> the workspace version
- `ExtractVariables` compares required variables in the template with the generated project files and creates missing `.auto.tfvars.json` content.
- `ExtractBackendConfig` creates `project.tfbackend` for the workspace state backend.

## Branch and version behavior

The module repo branch/version mapping is explicitly handled in `RepositoryService.FetchModuleRepository`.

```mermaid
flowchart TD
    A[workspace version: 2.7.1] --> B[branch config: dev]
    B --> C[refName = dev-2.7.1]
    C --> D{Does tag/branch exist in module repo?}
    D -->|Yes| E[Checkout repo tag/branch]
    D -->|No| F[Fallback to default branch main]
```

This means the module repository can track multiple infrastructure versions without mixing them into a single source-of-truth repo. The project infrastructure repo remains the repository where the actual generated Terraform project lives, while the module repo supplies the reusable building blocks.

## Pull request integration

Once the workspace branch contains generated Terraform files and variable settings, the provisioner pushes the branch and opens a pull request.

```mermaid
flowchart LR
    A[Generated workspace project files] --> B[git commit in infrastructure repo]
    B --> C[git push branch <workspaceAcronym>]
    C --> D[CreateInfrastructurePullRequest]
    D --> E[Azure DevOps REST API call]
    E --> F[PR created from workspace branch to main]
    F --> G[Optional auto-complete]
```

The PR is created using the Azure DevOps API configured in `InfrastructureRepository.PullRequestUrl` and `InfrastructureRepository.ApiVersion`. If auto-complete is enabled, the provisioner patches the PR with completion metadata and sets the repository to allow the branch to complete once checks pass.

## Summary

The module repository and infrastructure repository have distinct responsibilities:

- Module repository = reusable Terraform source templates and modules.
- Infrastructure repository = generated workspace project state, branch-per-workspace changes, and PR review workflow.

The flow is:

1. Clone module repo and select versioned module source.
2. Clone infrastructure repo and check out the workspace branch.
3. Copy template files from the module repo into the workspace project directory.
4. Generate backend and variable files.
5. Commit and push the infrastructure repo branch.
6. Open a PR from the workspace branch into the main infrastructure branch.

This keeps the Terraform template set reusable and versioned, while the project infra repo remains the controlled, reviewable deployment artifact for each workspace.
