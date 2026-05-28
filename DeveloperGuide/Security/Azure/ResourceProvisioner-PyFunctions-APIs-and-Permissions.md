# ResourceProvisioner PyFunctions — APIs and Required Permissions

This document lists all Azure and external APIs used by `ResourceProvisioner/src/ResourceProvisioner_PyFunctions`, along with the recommended Azure Roles and API permissions required for the service principal (App Registration) that runs these functions.

---

## Overview

The PyFunctions application is an Azure Functions app that synchronizes workspace users across three resource types:

1. **Azure Key Vault** — manages access policies for workspace users
2. **Azure Storage** — manages RBAC role assignments on storage accounts
3. **Azure Databricks** — manages users, groups, and secret scopes in Databricks workspaces
4. **Azure Service Bus** — sends bug reports and health check messages to queues

---

## APIs Used

### 1. Azure Key Vault Management (Control Plane)

| SDK Package | API Operations |
|---|---|
| `azure-mgmt-keyvault` | `vaults.get`, `vaults.begin_create_or_update` |
| `azure-mgmt-keyvault.models` | `AccessPolicyEntry`, `VaultAccessPolicyParameters`, `SecretPermissions` |
| `azure-mgmt-keyvault` | `secrets.list` |

**Purpose:** Reads and updates Key Vault access policies for workspace users. Adds, updates, or removes user access policies (get, list, set, delete permissions on secrets).

### 2. Azure Authorization Management (RBAC)

| SDK Package | API Operations |
|---|---|
| `azure-mgmt-authorization` | `role_assignments.create` |
| `azure-mgmt-authorization` | `role_assignments.list_for_scope` |
| `azure-mgmt-authorization` | `role_assignments.delete_at_scope` |

**Purpose:** Assigns and removes RBAC roles (Storage Blob Data Contributor / Reader) on Azure Storage accounts for workspace users.

**Built-in Role IDs Used:**
- `ba92f5b4-2d11-453d-a403-e96b0029c9fe` — Storage Blob Data Contributor
- `acdd72a7-3385-48ef-bd42-f606fba81ae7` — Storage Blob Data Reader

### 3. Azure Databricks (Workspace API)

| SDK Package | API Operations |
|---|---|
| `databricks-sdk` | `users.list`, `users.create`, `users.update`, `users.delete` |
| `databricks-sdk` | `groups.list` |
| `databricks-sdk` | `secrets.list_scopes`, `secrets.create_scope`, `secrets.put_secret`, `secrets.delete_scope` |

**Purpose:** Manages Databricks workspace users (create, update, delete), group membership, and secret scopes backed by Azure Key Vault.

### 4. Azure Service Bus

| SDK Package | API Operations |
|---|---|
| `azure-servicebus` | `ServiceBusClient.from_connection_string` |
| `azure-servicebus` | `get_queue_sender`, `send_messages` |

**Purpose:** Sends bug report messages and infrastructure health check result messages to Service Bus queues.

**Queues Used:**
- `bug-report` (configurable via `AzureServiceBusQueueName4Bugs`)
- `infrastructure-health-check-results` (configurable via `AzureServiceBusQueueName4Results`)
- `user-run-request` (trigger queue for workspace sync)

### 5. Azure Identity

| SDK Package | API Operations |
|---|---|
| `azure-identity` | `ClientSecretCredential` |

**Purpose:** Authenticates the service principal using client ID, client secret, and tenant ID for all management API calls.

---

## Required Azure Roles

The following Azure RBAC roles should be assigned to the service principal (App Registration) used by the function app:

| Resource | Recommended Role | Justification |
|---|---|---|
| **Key Vault(s)** | `Key Vault Contributor` | Required to read and update vault access policies via the management plane (`vaults.get`, `vaults.begin_create_or_update`) |
| **Key Vault(s)** | Access Policy: `Secret > Get, List` | Required to list secrets in the vault (for Databricks secret scope sync) |
| **Storage Account(s)** | `User Access Administrator` | Required to create and delete role assignments (`role_assignments.create`, `role_assignments.delete_at_scope`) on storage accounts |
| **Resource Group(s)** | `Reader` | Required to resolve resource scopes for role assignment operations |
| **Databricks Workspace(s)** | Workspace Admin (via service principal) | Required to manage users, groups, and secret scopes in Databricks |
| **Service Bus Namespace** | `Azure Service Bus Data Sender` | Required to send messages to queues (`bug-report`, `infrastructure-health-check-results`) |
| **Service Bus Namespace** | Queue trigger requires `Azure Service Bus Data Receiver` | Required to receive messages from the `user-run-request` queue |

---

## Required App Registration (Service Principal) Configuration

### Environment Variables

| Variable | Purpose |
|---|---|
| `AzureClientId` | Service principal client ID |
| `AzureClientSecret` | Service principal client secret |
| `AzureTenantId` | Azure AD tenant ID |
| `AzureSubscriptionId` | Target Azure subscription |
| `DataHub_ENVNAME` | Environment name (used in resource naming conventions) |
| `DatahubServiceBus` | Service Bus connection string |
| `AzureServiceBusQueueName4Bugs` | Bug report queue name (default: `bug-report`) |
| `AzureServiceBusQueueName4Results` | Health check results queue name (default: `infrastructure-health-check-results`) |

### Authentication Method

The application uses `ClientSecretCredential` (client ID + client secret) for all Azure management API calls and `azure-client-secret` auth type for Databricks SDK authentication.

---

## Summary of Minimum Permissions

| Scope | Permission / Role |
|---|---|
| Subscription or Resource Group | `User Access Administrator` (for storage RBAC) |
| Key Vault (management plane) | `Key Vault Contributor` |
| Key Vault (data plane) | Access Policy with Secret `Get`, `List` |
| Databricks Workspace | Admin-level service principal access |
| Service Bus Namespace | `Azure Service Bus Data Sender` + `Azure Service Bus Data Receiver` |

---

## Notes

- The function uses the **access policy** model for Key Vault (not Azure RBAC for Key Vault data plane). The vault must have access policies enabled.
- Storage account role assignments use the built-in `Storage Blob Data Contributor` and `Storage Blob Data Reader` roles.
- Databricks authentication uses the Azure service principal with `azure-client-secret` auth type, which requires the SP to be added as a workspace admin.
- The Service Bus connection uses AMQP over WebSocket transport (`AmqpOverWebsocket`).

> This document was developed with the assistance of generative AI tools to support drafting, diagram generation and structuring activities. No Protected B or sensitive Government of Canada information was entered into these tools. All content has been reviewed, validated, and approved by the author to ensure accuracy, completeness, and compliance with Government of Canada security policies, standards, and applicable Treasury Board guidance.