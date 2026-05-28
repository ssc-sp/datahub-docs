# Azure Security Documentation

This folder contains documentation on Azure service integrations, required permissions, and credential management across the FSDH platform components.

---

## Service Summaries

These documents provide a comprehensive inventory of all external Azure services consumed by each application, including dependency trees, source file references, and required RBAC roles/API permissions.

| Document | Description |
|---|---|
| [Portal Services Summary](Portal-Services-Summary.md) | External services consumed by the Datahub.Portal Blazor application (SQL, Blob Storage, Key Vault, Cost Management, Graph, etc.) |
| [Datahub Functions Services Summary](Datahub-Functions-Services-Summary.md) | External services consumed by the Datahub.Functions app (Service Bus triggers, Cost Management, Graph, DevOps, health checks) |
| [ResourceProvisioner Functions Services Summary](ResourceProvisioner-Functions-Services-Summary.md) | External services consumed by the ResourceProvisioner.Functions app (Service Bus, DevOps Git/REST, Terraform file generation) |
| [ResourceProvisioner PyFunctions APIs and Permissions](ResourceProvisioner-PyFunctions-APIs-and-Permissions.md) | APIs and permissions for the Python-based ResourceProvisioner functions (Key Vault, Storage RBAC, Databricks user sync) |

---

## Credential Management

These documents describe how the `ISystemTokenCredentialService` is used across the codebase to authenticate against Azure services using managed identities and service principals.

| Document | Description |
|---|---|
| [ISystemTokenCredentialService Usage](ISystemTokenCredentialService-Usage.md) | Cross-project usage of the credential service interface across Shared, Portal, ResourceProvisioner, and test projects |

> This document was developed with the assistance of generative AI tools to support drafting, diagram generation and structuring activities. No Protected B or sensitive Government of Canada information was entered into these tools. All content has been reviewed, validated, and approved by the author to ensure accuracy, completeness, and compliance with Government of Canada security policies, standards, and applicable Treasury Board guidance.