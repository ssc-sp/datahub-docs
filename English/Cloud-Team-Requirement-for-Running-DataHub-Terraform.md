
## Prereq
The following requirements must be met outside this Terraform code in advance. Some tasks must be completed by a more privileged user (e.g. the organizational Cloud operation team). The information will feed into the environment specific TF files (e.g. env/dev.tf). This Terraform code also generates output to show important information that will be used for other tasks (such as connecting with a centralized WAF for the organization).

1. Created a new resource group (e.g. fsdh-dev-rg where dev is for DEV) for hosting the DataHub Portal application
2. Created a new AAD group using naming convention `fsdh-group-admin-dev` for system admin users (e.g. dev is for DEV). This group should have the following Azure roles
   - Owner over the resource group
3. Created a new AAD group using naming convention `fsdh-group-dba-dev` for DBA users (e.g. dev is for DEV). This group will be assigned as the DBA for Azure managed databases.
4. Created a separate storage account in a dedicated resource group for storing Terraform backend state. Grant the contributor role to the admin group;
5. Created a new app registration (e.g. fsdh-app-dev) for the Datahub Portal App and created a client secret. The app registration must have ID token enabled and have the following permissions:
     |Permission | Type | Granted Through|
     |--|--|--|
     |User.Read | Delegated | Admin consent|
     | User.ReadBasic.All |Delegated| Admin consent|
     |User.Read.All|Delegated| Admin consent|
     |Directory.Read.Alll|Delegated| Admin consent|
     |Directory.AccessAsUser.All|Delegated| Admin consent|
     |User.Invite.All|Application| Admin consent|
     |Directory.Read.All|Application| Admin consent|
     |User.Read.All|Application| Admin consent|
   - Granted permissions User.Invite.All and GroupMember.ReadWrite.All. Admin consent has been granted
5. Create a new app registration (e.g. fsdh-billing-dev) for calling the billing API. The app registration must have the "Cost Management Reader" role.
6. Created the key vault "fsdh-key-env" and created the Key vault access policy for the user running Terraform
7. Created secrets "datahubportal-client-id" and "datahubportal-client-secret" to match the app registration
8. Created secrets "datahub-smtp-username" and "datahub-smtp-password" for SMTP authentication
9. Created secret "deepl-authkey" in Key Vault 
10. Created secrets "terraform-backend-key" and "terraform-backend-storage"
11. Populated environment specific file (e.g. env/dev/dev.tf)