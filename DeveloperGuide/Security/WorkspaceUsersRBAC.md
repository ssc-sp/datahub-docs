# Function App Role Grants and Resource Targets

This document summarizes what access is granted by the Resource Provisioner Python function app, based on the current implementation in [ResourceProvisioner/src/ResourceProvisioner_PyFunctions/function_app.py](https://github.com/ssc-sp/datahub-portal/tree/develop/ResourceProvisioner/src/ResourceProvisioner_PyFunctions/function_app.py) and related helper modules.

Resource-specific details are documented here:

- [Databricks workspace RBAC](RBAC/DatabricksWorkspace.md)
- [Azure Key Vault RBAC](RBAC/AzureKeyVault.md)
- [Azure Storage (Blob) RBAC](RBAC/AzureStorageBlob.md)

## When role grants run

The function app synchronizes users based on template names in the workspace definition:

- new-project-template: key vault access policies
- azure-storage-blob: storage account role assignments
- azure-databricks: Databricks workspace users and groups
- `terraform:<template>`: prefixed variants of the same three templates are also supported

Source: [ResourceProvisioner/src/ResourceProvisioner_PyFunctions/function_app.py](https://github.com/ssc-sp/datahub-portal/tree/develop/ResourceProvisioner/src/ResourceProvisioner_PyFunctions/function_app.py)

## Role grants by resource

- Databricks workspace: see [Databricks workspace RBAC](RBAC/DatabricksWorkspace.md)
- Azure Key Vault: see [Azure Key Vault RBAC](RBAC/AzureKeyVault.md)
- Azure Storage (Blob): see [Azure Storage (Blob) RBAC](RBAC/AzureStorageBlob.md)

## Resources affected

The target resources are derived from the workspace definition and environment name:

- Resource group: `fsdh_proj_<WorkspaceAcronym>_<Environment>_rg`
- Key vault: `fsdh-proj-<WorkspaceAcronym>-<Environment>-kv`
- Storage account: `fsdhproj<WorkspaceAcronym><Environment>`
- Databricks workspace: host URL from AppData.DatabricksHostUrl in the workspace definition

Sources:

- [ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/constants.py](https://github.com/ssc-sp/datahub-portal/tree/develop/ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/constants.py)
- [ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/azkeyvault_utils.py](https://github.com/ssc-sp/datahub-portal/tree/develop/ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/azkeyvault_utils.py)
- [ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/azstorage_utils.py](https://github.com/ssc-sp/datahub-portal/tree/develop/ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/azstorage_utils.py)
- [ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/databricks_utils.py](https://github.com/ssc-sp/datahub-portal/tree/develop/ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/databricks_utils.py)
