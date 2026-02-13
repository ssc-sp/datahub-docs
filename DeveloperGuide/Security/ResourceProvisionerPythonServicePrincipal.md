# Resource Provisioner (Python) service principal (`AzureClientId`)

The Resource Provisioner Python functions use a service principal (non-interactive credentials) to call Azure management and data-plane APIs.

## Configuration

Environment variables used by `ResourceProvisioner_PyFunctions`:

- `AzureClientId`
- `AzureClientSecret`
- `AzureTenantId`
- `AzureSubscriptionId`

Additional environment variables may exist for specific integrations (Storage, Databricks, Service Bus), but the four above are the core service-principal credential inputs.

## Primary usage locations

- Storage RBAC via SP (Authorization client)
  - `ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/azstorage_utils.py` — [`ClientSecretCredential` → `AuthorizationManagementClient`](https://github.com/ssc-sp/datahub-portal/tree/develop/ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/azstorage_utils.py#L56-L86)

- Key Vault management via SP
  - `ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/azkeyvault_utils.py` — [`ClientSecretCredential` → `KeyVaultManagementClient`](https://github.com/ssc-sp/datahub-portal/tree/develop/ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/azkeyvault_utils.py#L9-L37)

- Databricks workspace auth via SP secret flow
  - `ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/databricks_utils.py` — [`WorkspaceClient` with `azure_client_secret/id/tenant_id`](https://github.com/ssc-sp/datahub-portal/tree/develop/ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/databricks_utils.py#L30-L55)
