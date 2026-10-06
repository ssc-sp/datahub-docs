# Databricks & Unity RBAC Role Mapping

This document describes the current implementation used by the Resource Provisioner.

## Current role mapping in code

The role-to-group mapping is defined in `get_definition_role_lookup()` in `ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/databricks_utils.py`:

| Portal role | Databricks group |
| --- | --- |
| `Owner` | `project_lead` |
| `Admin` | `admins` |
| `User` | `project_users` |
| `Guest` | `project_users` |
| `Removed` | user is deleted from the Databricks workspace |

The implementation treats `Guest` as part of the shared `project_users` group rather than a separate Databricks group.

## Workspace group behavior

When the workspace definition is synchronized, the Resource Provisioner:

1. Reads each user and role from the workspace definition JSON.
2. Finds or creates the matching Databricks user.
3. Adds the user to the role-mapped Databricks group.
4. Deletes users with `Role == Removed` from the workspace.

The group mapping is currently implemented as a direct role-to-group lookup and is not creating separate account groups such as `project_admins` or `project_guests`.

## Unity Catalog permissions

The catalog-level permission presets are defined in `ResourceProvisioner/src/ResourceProvisioner_PyFunctions/lib/unity_catalog_constants.py`.

| Role | Preset | Applied catalog privileges |
| --- | --- | --- |
| `Owner` | `ALL_PRIVILEGES` | `ALL_PRIVILEGES` |
| `Admin` | `DATA_EDITOR` | `USE_CATALOG`, `CREATE_SCHEMA`, `BROWSE`, `APPLY_TAG`, `USE_SCHEMA`, `EXECUTE`, `READ_VOLUME`, `SELECT`, `MODIFY`, `WRITE_VOLUME`, `CREATE_FUNCTION`, `CREATE_MATERIALIZED_VIEW`, `CREATE_MODEL`, `CREATE_TABLE`, `CREATE_VOLUME` |
| `User` | `DATA_EDITOR` | same as `Admin` |
| `Guest` | `DATA_READER` | `USE_CATALOG`, `BROWSE`, `USE_SCHEMA`, `EXECUTE`, `READ_VOLUME`, `SELECT` |

In `synchronize_unity_catalog_permissions()`, the code resolves each workspace user to a Databricks principal and calls `workspace_client.grants.update(...)` against the workspace catalog.

## What is not part of the current implementation

The current Resource Provisioner code does not create or manage:

- separate `project_admins` account group
- separate `project_guests` account group
- storage credentials for Azure managed identities
- external locations
- `READ FILES` / `WRITE FILES` grants on external locations
- Access Connector setup for workspace storage access

These are therefore not part of the current code path and should not be described as active behavior in this document.

## Current implementation summary

The Resource Provisioner currently implements a simple user synchronization model:

- `Owner` -> `project_lead`
- `Admin` -> `admins`
- `User` -> `project_users`
- `Guest` -> `project_users`

And applies Unity Catalog grants directly to the user principal at the catalog level using the preset values above.

This is the behavior represented in the current code and is the basis for the role mapping shown here.

> This document was developed with the assistance of generative AI tools to support drafting, diagram generation and structuring activities. No Protected B or sensitive Government of Canada information was entered into these tools. All content has been reviewed, validated, and approved by the author to ensure accuracy, completeness, and compliance with Government of Canada security policies, standards, and applicable Treasury Board guidance.
