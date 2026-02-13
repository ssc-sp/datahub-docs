# Databricks workspace RBAC grants

This page documents how the Resource Provisioner Python function app applies user access in an Azure Databricks workspace, based on the current implementation in [ResourceProvisioner/src/ResourceProvisioner_PyFunctions/function_app.py](https://github.com/ssc-sp/datahub-portal/tree/develop/ResourceProvisioner/src/ResourceProvisioner_PyFunctions/function_app.py) and related helper modules.

## Role mapping

Roles in the workspace definition are mapped to Databricks groups:

- `Owner` -> `project_lead`
- `Admin` -> `admins`
- `User` -> `project_users`
- `Guest` -> `project_users`

## Behavior

- Users with Role == Removed are deleted from the workspace.
- Users are created if missing and updated to the correct group if present.
- A secret scope named dh-workspace is created if missing, backed by the project key vault, with initial_manage_principal set to users.

## Databricks permissions vs Azure RBAC

There are two separate permission systems involved:

- Databricks workspace permissions (data plane): what a user can do *inside* the Databricks workspace (for example: sign in to the workspace UI, use notebooks/clusters, access secret scopes), governed by Databricks users/groups and Databricks ACLs.
- Azure RBAC on the Databricks workspace resource (management plane): what a user can do to the *Azure resource* representing the Databricks workspace (for example: view the workspace resource, configure Azure-side settings, assign Azure roles), governed by Azure role assignments.

Important implications:

- Being assigned to a Databricks group by the Resource Provisioner does not automatically grant Azure RBAC permissions on the Databricks workspace resource.
- Having Azure RBAC permissions on the Databricks workspace resource does not automatically make a user a member of the Databricks workspace or grant Databricks in-workspace privileges.

This document covers the Resource Provisioner behavior for Databricks workspace users/groups. Azure RBAC on the Databricks workspace resource is not managed by this part of the function app.

## Target resource

- Databricks workspace: host URL from AppData.DatabricksHostUrl in the workspace definition

## Sources

- [ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/databricks_utils.py](https://github.com/ssc-sp/datahub-portal/tree/develop/ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/databricks_utils.py)
- [ResourceProvisioner/src/ResourceProvisioner_PyFunctions/function_app.py](https://github.com/ssc-sp/datahub-portal/tree/develop/ResourceProvisioner/src/ResourceProvisioner_PyFunctions/function_app.py)
