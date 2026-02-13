# Azure Storage (Blob) RBAC grants

This page documents how the Resource Provisioner Python function app assigns Azure role assignments on the project storage account, based on the current implementation in [ResourceProvisioner/src/ResourceProvisioner_PyFunctions/function_app.py](https://github.com/ssc-sp/datahub-portal/tree/develop/ResourceProvisioner/src/ResourceProvisioner_PyFunctions/function_app.py) and related helper modules.

## Role mapping

The function app assigns a role definition at the storage account scope based on requested `Role` in the queue:

- `Guest`: READER role
- `Owner`, `Admin`, `User`: CONTRIBUTOR role
- `Removed`: existing role assignment is removed

**Important note:** `Guest` refers to GoC guest users. GCCF users cannot join the databricks workspace.

## Target resource

The storage account name is derived from the workspace definition and environment name:

- Storage account: `fsdhproj<WorkspaceAcronym><Environment>`

## Sources

- [ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/azstorage_utils.py](https://github.com/ssc-sp/datahub-portal/tree/develop/ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/azstorage_utils.py)
- [ResourceProvisioner/src/ResourceProvisioner_PyFunctions/function_app.py](https://github.com/ssc-sp/datahub-portal/tree/develop/ResourceProvisioner/src/ResourceProvisioner_PyFunctions/function_app.py)
