# Change Log

## DataHub Core App
| Version | [DEV](https://dev.fsdh-dhsf.science.cloud-nuage.canada.ca/) | [INT](https://int.fsdh-dhsf.science.cloud-nuage.canada.ca/) | [POC](https://federal-science-datahub.canada.ca/) | Notes |
|---|---|---|---|---|
|[Infra v2.12-rc1](https://github.com/ssc-sp/datahub-infra/tree/v2.12-rc1)|2023-09-21|2023-09-21|-| [See below](#datahub-infra-v212-) |

## Project Resource Modules
| Version | Release Date | Changes |
|---|---|---|
|[v2.12.0](https://github.com/ssc-sp/datahub-resource-modules/tree/versioning/modules/v2.12.0)| Pending |[See below](#project-resource-module-v212-)|
|[v2.13.0](https://github.com/ssc-sp/datahub-resource-modules/tree/2.13.x/modules/v2.13.0)| Pending |[See below](#project-resource-module-v213-)|

## Changes

### DataHub Infra v2.12
- Added automation account and currently to scale down app service plan at 8PM
- Add configuration `DesktopFileUploader__DisplayDesktopUploaderTab`
- Add secrets `ado-service-user-oid` and `ado-service-user-pat`

### Project Resource Module v2.13
- Added Azure file share (limit to 64GB) and map to app service 
- Grant secret scope permission to all Databricks users (except guests)

### Project Resource Module v2.12
- Removed user creation and group membership
- Remove storage role assignment from Terraform
- Both of the above are being delegated to a standalone function using Python to addresses the delays during user update
