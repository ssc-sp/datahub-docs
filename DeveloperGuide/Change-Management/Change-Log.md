# Change Log

## DataHub Core App
| Version | [DEV](https://dev.fsdh-dhsf.science.cloud-nuage.canada.ca/) | [INT](https://int.fsdh-dhsf.science.cloud-nuage.canada.ca/) | [POC](https://federal-science-datahub.canada.ca/) | Notes |
|---|---|---|---|---|
|[Infra v2.12-rc1](https://github.com/ssc-sp/datahub-infra/tree/v2.12-rc1)|2023-09-21|2023-09-21|-| [...](#infra212) |

## Project Resource Modules
| Version | Release Date | Changes |
|---|---|---|
|[v2.12.0](https://github.com/ssc-sp/datahub-resource-modules/tree/2.12.x/modules/v2.12.0)| Pending |[...](#resource212)|

## Changes

### DataHub Infra v2.12 <a name="infra212"></a>
- Added automation account and currently to scale down app service plan at 8PM
- Add configuration `DesktopFileUploader__DisplayDesktopUploaderTab`
- Add secrets `ado-service-user-oid` and `ado-service-user-pat``

### Project Resource Module v2.12 <a name="resource212"></a>
- Added Azure file share (limit to 64GB) and map to app service 
- Grant secret scope permission to all Databricks users (except guests)
