# Protected B Workspace Isolation

## Workspace visibility

Protected B workspaces are only visible to members of the workspaces and are not visible in any other page in the portal.

## Labelling

Protected B is clearly displayed on every page in a Protected B workspace.

## Role-Based Access Control (RBAC) with Protected B workspaces

Since Protected B workspaces cannot accommodate external users via the standard invitation flow, RBAC mechanisms ensure only authorized internal (Entra-authenticated) users can access Protected B content.

### Internal-Only Access Model

- Protected B workspaces are restricted to Government of Canada (GC) users authenticating via Azure Entra
- All workspace members must have valid GC email addresses and Entra credentials
- Role assignments within Protected B workspaces leverage [UserRoleLinks](../Database/UserRoleLinks.md) to define granular access permissions
- Admin interfaces must prevent any attempt to create external user invitations for Protected B workspaces

### Role Hierarchy

- **Workspace Admin**: Can manage Protected B workspace members and modify role assignments; must be a GC user
- **Contributor**: Can read and write data within the Protected B workspace; must be a GC user
- **Viewer**: Can only read data; must be a GC user
- External user roles are not applicable to Protected B workspaces

### Access Control Enforcement

- Authentication layer validates that login is via Azure Entra (not GCCF)
- Authorization layer checks both workspace membership and role assignment before granting access
- Any attempt to grant access to external users is rejected at the workflow layer (invitation system blocks Protected B selection)
- Session validation ensures user context remains Entra-authenticated throughout the session

### Database integrity

By design, external users and roles cannot be assigned to a Protected B worspaces. However, in case of database corruption or other bugs, FSDH executes on a daily basis a service to validates the database integrity for Protected B workspaces:

- if any external users are found, the service will delete them and log the error
- if any external roles are assigned in a Protected B workspace, the service will delete them and log the error

## Databricks

Databricks requires Entra authentication and is by default restricted to GoC users. Databricks RBAC is synchronized to FSDH RBAC as well to restrict specific users.

## Web Application

The web application is only accessible when RBAC permissions are assigned. See Section RBAC above.

## Storage

The file explorer in the portal and `azcopy` are only accessible when RBAC permissions are assigned. See Section RBAC above.
