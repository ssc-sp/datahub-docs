# Azure Key Vault RBAC grants

This page documents how the Resource Provisioner Python function app applies access policies to the project Azure Key Vault, based on the current implementation in [ResourceProvisioner/src/ResourceProvisioner_PyFunctions/function_app.py](https://github.com/ssc-sp/datahub-portal/tree/develop/ResourceProvisioner/src/ResourceProvisioner_PyFunctions/function_app.py) and related helper modules.

## Role mapping

The function app applies access policies on the project key vault based on requested `Role` in the queue:

- `Owner` or `Admin`: secrets permissions list, get, delete, set
- `User` or `Guest`: secrets permissions list, get
- `Removed`: access policy is removed

**Important note:** `Guest` refers to GoC guest users. GCCF users cannot join the databricks workspace.

## Target resource

The key vault name is derived from the workspace definition and environment name:

- Key vault: `fsdh-proj-<WorkspaceAcronym>-<Environment>-kv`

## Sources

- [ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/azkeyvault_utils.py](https://github.com/ssc-sp/datahub-portal/tree/develop/ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/azkeyvault_utils.py)
- [ResourceProvisioner/src/ResourceProvisioner_PyFunctions/function_app.py](https://github.com/ssc-sp/datahub-portal/tree/develop/ResourceProvisioner/src/ResourceProvisioner_PyFunctions/function_app.py)
