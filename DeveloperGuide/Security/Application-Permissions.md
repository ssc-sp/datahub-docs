# Initial Configuration

## Prerequisites and Azure Requirements for Application Permissions

The following items must be completed **before** running Terraform for a new environment. Some actions require elevated permissions (for example, Cloud Operations or Entra ID administrators).

Use this page as a deployment checklist for each environment (`dev`, `test`, `prod`).

## Naming and Environment Inputs

Prepare the environment suffix and naming values used by Terraform and Azure resources.

- Environment code (example: `dev`)
- Resource group name for DataHub (example: `fsdh-dev-rg`)
- Key Vault name (example pattern: `fsdh-key-<env>`)
- App registration display names (examples: `fsdh-app-dev`, `fsdh-billing-dev`)

## Resource Groups and Terraform Backend

Create the required Azure resource containers before deployment.

- Create a resource group for the DataHub portal and related resources.
- Create a separate storage account in a dedicated resource group for Terraform backend state.
- Grant the `Contributor` role on the Terraform backend storage scope to the DataHub admin group.

## Entra ID (Azure AD) Groups and RBAC

Create the Entra ID groups used by platform operations.

- Admin group using naming convention `fsdh-group-admin-<env>`
   - Assign `Owner` at the DataHub resource group scope.
- DBA group using naming convention `fsdh-group-dba-<env>`
   - Use this group for Azure managed database DBA assignments.

## DataHub Portal App Registration

Create the portal app registration (example: `fsdh-app-dev`) and configure authentication and Graph permissions.

### Required app configuration

- Create a client secret for the app registration.
- Enable ID tokens for sign-in flows where required by the portal.
- Record and store:
   - Application (client) ID
   - Directory (tenant) ID
   - Client secret value (store only in Key Vault, not in source files)

### Microsoft Graph API permissions

Add the following Graph permissions and grant tenant-wide admin consent.

| Permission                 | Type        | Consent Required |
| -------------------------- | ----------- | ---------------- |
| User.Read                  | Delegated   | Admin consent    |
| User.ReadBasic.All         | Delegated   | Admin consent    |
| User.Read.All              | Delegated   | Admin consent    |
| Directory.Read.All         | Delegated   | Admin consent    |
| Directory.AccessAsUser.All | Delegated   | Admin consent    |
| User.Invite.All            | Application | Admin consent    |
| Directory.Read.All         | Application | Admin consent    |
| User.Read.All              | Application | Admin consent    |
| GroupMember.ReadWrite.All  | Application | Admin consent    |

After permissions are added:

- Select **Grant admin consent** for the tenant.
- Verify status is granted for each required permission.

## Billing App Registration

Create a dedicated app registration for billing API calls (example: `fsdh-billing-dev`).

- Assign `Cost Management Reader` at the required billing scope.
- Store client credentials in Key Vault if used by automation.

## Key Vault and Required Secrets

Create the Key Vault and add secrets required by platform deployment and runtime.

- Create Key Vault `fsdh-key-<env>`.
- Grant the user/service principal running Terraform the required Key Vault permissions.
- Create these secrets:
   - `datahubportal-client-id`
   - `datahubportal-client-secret`
   - `datahub-smtp-username`
   - `datahub-smtp-password`
   - `deepl-authkey`
   - `terraform-backend-key`
   - `terraform-backend-storage`

## Terraform Configuration Inputs

Populate environment-specific Terraform values (example: `env/dev/dev.tf`) using the created Azure resources.

At minimum, validate:

- Resource group names and subscription identifiers
- App registration/client IDs
- Key Vault name and secret references
- Terraform backend storage settings

## Validation Before Deployment

Before running Terraform apply, confirm:

- Required Entra ID groups exist and RBAC assignments are complete.
- App registrations exist with correct Graph permissions.
- Admin consent is granted for all required permissions.
- Key Vault contains all required secrets.
- Environment `.tf` files are updated with correct values.