# Databricks Unity Catalog ACLs and Workspace Sharing Summary

This note summarizes the Databricks Unity Catalog access model for shared catalogs and the additional requirements for sharing a catalog from one workspace to another.

## Short version

- Unity Catalog access is not shared by default.
- A catalog is private to the workspace and metastore unless an explicit sharing configuration is created.
- Sharing a catalog with another Databricks workspace is an explicit Databricks feature and requires both workspaces to be in the same Unity Catalog metastore model and to be granted access through the share mechanism.
- In practice, the provider workspace creates a share, adds the catalog to that share, and the recipient workspace accepts the share and creates an imported catalog. Access is then granted through Unity Catalog privileges, not by implicit workspace-wide permissions.

## No sharing by default

Databricks does not automatically expose a workspace catalog to other workspaces. A catalog is only visible to the workspace that owns it unless a specific Databricks share is created and approved by the recipient workspace.

This means:

- A workspace catalog is isolated by default.
- A user in another workspace cannot see or query the catalog unless the metastore-level sharing flow is configured.
- There is no inherited access simply because the two workspaces exist in the same account or because the same principal has access in both places.

> In other words, catalog sharing is opt-in and must be deliberately configured. The default state is “no sharing.”

## What is required to share one catalog with another workspace

To share a catalog from one workspace to another, the following conditions are normally required:

1. Unity Catalog is enabled for the workspace and metastore
   - Both workspaces must use Unity Catalog.
   - The catalog must live in a metastore that supports cross-workspace sharing.

2. Both workspaces are in the same Databricks account / metastore context
   - Workspace-to-workspace catalog sharing is not a generic file-share pattern; it relies on the Unity Catalog metastore and share model.
   - The provider workspace and recipient workspace must be able to participate in the same metastore sharing flow.

3. The provider workspace creates a catalog share
   - A metastore admin or catalog owner with the appropriate permissions creates the share.
   - The catalog to be shared is added to the share.
   - The share is then made available to the target workspace.

4. The recipient workspace is granted access to the share
   - The target workspace must accept or be granted access to the share.
   - After that, Databricks creates a shared catalog object in the recipient workspace.

5. Consumer-side Unity Catalog privileges are granted on the imported catalog
   - The recipient workspace users still need Unity Catalog privileges such as `USE CATALOG`, `USE SCHEMA`, and `SELECT`.
   - Without those privileges, a user can see the imported catalog but still cannot read its objects.

## ACLs and privileges involved

The required access is split across the provider-side catalog and the recipient-side imported catalog.

### Provider side: owner / metastore admin controls

The workspace that owns the catalog must have the required Unity Catalog permissions to create and manage a share. This typically means:

- Metastore admin or equivalent catalog ownership/administrative rights
- Ability to manage the catalog and its securable objects
- Ability to add the catalog to a share and define the share contents

The provider-side catalog is still governed by standard Unity Catalog grants. For example, a catalog owner or admin may grant access to internal workspace groups such as:

```sql
GRANT USE CATALOG, USE SCHEMA, SELECT, MODIFY, CREATE TABLE
ON CATALOG <workspace_catalog>
TO `project_users`;

GRANT USE CATALOG, USE SCHEMA, SELECT
ON CATALOG <workspace_catalog>
TO `project_guests`;
```

These are the normal workspace-local ACLs used to control access within the owning workspace. They do not automatically make the catalog available to another workspace.

### Recipient side: imported shared catalog access

Once the target workspace receives the share, the imported shared catalog is treated as a separate object in that workspace. The receiving workspace must still assign privileges to its own groups or users:

```sql
GRANT USE CATALOG, USE SCHEMA, SELECT
ON CATALOG <shared_catalog_name>
TO `project_users`;

GRANT USE CATALOG, USE SCHEMA, SELECT
ON CATALOG <shared_catalog_name>
TO `project_guests`;
```

For read-write consumer access, the recipient can grant broader rights as needed, such as `MODIFY` or `CREATE TABLE`, but the catalog is only usable once the share has been accepted and the imported object is in the consumer workspace.

## Required Databricks features and permissions

For a cross-workspace catalog share, the feature set is not just a generic ACL change. The following are required:

- Unity Catalog enabled on the metastore and workspace
- Sharing enabled in the Databricks account / metastore configuration
- A valid catalog share created by the provider workspace
- Recipient workspace access to the share
- Unity Catalog privilege grants at both ends of the flow

Without all of these, the catalog remains inaccessible across workspaces even if the users belong to the same account or have similar roles.

## Practical pattern

A typical working pattern is:

1. Workspace A owns catalog `proj_a`.
2. Workspace A administrator or metastore admin creates a share and includes `proj_a`.
3. Workspace B is invited or assigned access to that share.
4. Workspace B accepts the share and sees an imported shared catalog.
5. Workspace B grants `USE CATALOG`, `USE SCHEMA`, and `SELECT` to its consumer groups.
6. Only then can users in Workspace B query the shared catalog.

## Operational guidance

- Do not assume any Databricks catalog is visible to another workspace.
- Treat catalog-sharing as an explicit metastore-level governance action.
- Separate the concepts clearly:
  - Workspace-local Unity Catalog grants govern access within the owning workspace.
  - Catalog sharing governs whether another workspace can receive the catalog.
  - Consumer-side grants govern what users in the recipient workspace can actually do with the imported shared catalog.

This combination of share configuration and Unity Catalog ACLs is the correct model for cross-workspace sharing.
