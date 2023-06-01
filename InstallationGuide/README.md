# Before You Start

It is important that you have a high level understanding of the DataHub architecture. This document walks you through the steps for a successful deployment of the DataHub solution in your own Azure tenant. 

Each DataHub environment resides in its own Resource Group (RG). Shared resources such as Terraform backend reside in a shared RG. The RG and Key Vault must exist before deployment.

The solution assumes the following:
- A DNS zone has been created in a shared RG for DNS domain delegation. For example, the Federal Science DataHub (FSDH) at SSC uses the domain ".fsdh-dhsf.science.cloud-nauge.canada.ca";
- A centrally managed Azure Log Analytics Workspace has been created in a shared RG and you have obtained the ID;
- An AAD group has been created in your tenant for app admins;
- (Optional) An AAD group has been created in your tenant for database admins. This group will be assigned as the DBA for Azure managed databases. You can choose to use the app admin group if desirable
- Create a new resource group for each environment for hosting the DataHub core app
   - Make the user running `terraform apply`: 1) the owner of the resource group; 2) A member of the app admin group
   - Assign Contributor of the resource group to the app admin group
- Create a separate storage account in a dedicated resource group for storing Terraform backend state. Grant the Contributor role to the app admin group;
- Create a new app registration for the Datahub Portal App and created a client secret with redirect URI `/signin-oidc`. The app registration must have ID token enabled and have the following permissions. Also reference the [preinstall code](preinstall/main/sp.tf)
     |Permission | Type | Granted Through |
     | --------- | ---- | --------------- |
     |Directory.AccessAsUser.All|Delegated| Admin consent|
     |Directory.Read.All|Delegated| Admin consent|
     |Directory.Read.All|Application| Admin consent|
     |User.Invite.All|Application| Admin consent|
     |User.Read | Delegated | Admin consent|
     |User.Read.All|Delegated| Admin consent|
     |User.Read.All|Application| Admin consent|
     |User.ReadBasic.All |Delegated| Admin consent|
- (Optional) The service principal used by Azure DevOps Service Connection should be the owner of the subscription and must have this application role: `Application.Read.All`
- In the new core resource group, create a Key Vault and create Key vault access policy for the app admin group. The Key vault must enable
     - Soft-delete
     - Purge protection
- Create Key Vault secrets. Also reference the [preinstall code](preinstall/main/kv.tf)
     |Secret name | Description | Notes|
     | ---------- | ----------- | ---- |
     |datahubportal-client-oid|The Enterprise App OID of the main app registration for the DataHub app||
     |datahubportal-client-id|Main app registration for the DataHub app||
     |datahubportal-client-secret|Main app registration for the DataHub app||
     |datahub-smtp-username|SMTP user name||
     |datahub-smtp-password|SMTP password||
     |deepl-authkey|API Key for DeepL translation||
- (Optional) Create the DNS zone outside this Terraform code and create DNS delegation by your parent DNS provider
- (Optional) Create the SSL/TLS certificate and transform to PFX then import to a KV outside the Terraform infrastructure
- Populated environment specific parameter file (e.g. [env/dev/dev.tf](env/dev/dev.tf))

# Decisions to Make

- Hosting your Terraform backend. 
- Creating a custom domain and optinally a DNS zone. 

# Create the Infrastructure

# Deploy the Application