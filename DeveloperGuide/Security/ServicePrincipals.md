# Azure service principals in `ssc-sp/datahub-portal`

This page is an index of the Azure service principals used across FSDH components.

## Service principal references

- Portal uses two service principals
  - Infrastructure service principal (`AzureAd:InfraClientId`): [InfraServicePrincipal.md](/DeveloperGuide/Security/InfraServicePrincipal.md)
  - Portal service principal (`AzureAd:ClientId`): [PortalServicePrincipal.md](/DeveloperGuide/Security/PortalServicePrincipal.md)
- Functions service principal (`FUNC_SP_CLIENT_ID`): [FunctionsServicePrincipal.md](/DeveloperGuide/Security/FunctionsServicePrincipal.md)
- ACL Python Synchronizer service principal (`AzureClientId`): [ResourceProvisionerPythonServicePrincipal.md](/DeveloperGuide/Security/ResourceProvisionerPythonServicePrincipal.md)
- Resource Provisioner (`InfrastructureRepository:AzureDevOpsConfiguration`) [ResourceProvisionerServicePrincipal.md](/DeveloperGuide/Security/ResourceProvisionerServicePrincipal.md)