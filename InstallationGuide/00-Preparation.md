## Step 0: Preparation

Before you can install DataHub, you need to configure your landing zone. Ensure that you know the following information before you start the installation process:

### Infrastructure

- [ ] Azure Tenant ID (GUID)
- [ ] Azure Subscription ID (GUID)
- [ ] Azure AD Domain Name (e.g. contoso.com)
- [ ] Custom Domain Name (e.g. datahub.com)
- [ ] Azure AD Group name for application admins (e.g. DataHub Admins)
- [ ] Azure AD Group name for application DBAs (e.g. DataHub DBAs)
- [ ] Azure AD Group name for application users (e.g. DataHub Users)
- [ ] Public domain DNS for external access (e.g. external.datahub.com)
- [ ] Whether you want to use MSI authentication for Databricks provider (e.g. run from Azure DevOps)
- [ ] Databricks Enterprise Object ID (GUID)
- [ ] Cosmos DB Enterprise Object ID (GUID)

### Portal

- [ ] Azure Resource Group Name
- [ ] Resource Prefix (e.g. fsdh)
- [ ] Main Key Vault Name & ID
- [ ] Email of the support contact
- [ ] PowerBI URL SPI (e.g. https://api.powerbi.com/v1.0/myorg)
- [ ] PowerBI PDF Viewer URL (e.g. https://app.powerbi.com/viewer)

### SMTP

- [ ] SMTP Host Name
- [ ] SMTP Port
- [ ] SMTP Sender Name
- [ ] SMTP Sender Email

### OpenData

- [ ] OpenData Approver Name
- [ ] OpenData Approver Email
- [ ] OpenData API URL (e.g. https://api.data.gov.sg/v1/environment/2-hour-weather-forecast)
