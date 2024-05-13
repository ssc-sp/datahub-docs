# Change Log

## DataHub Core App
| Version | [DEV](https://dev.fsdh-dhsf.science.cloud-nuage.canada.ca/) | [INT](https://int.fsdh-dhsf.science.cloud-nuage.canada.ca/) | [POC](https://federal-science-datahub.canada.ca/) | Notes |
|---|---|---|---|---|
|[Infra v2.12-rc1](https://github.com/ssc-sp/datahub-infra/tree/v2.12-rc1)|2023-09-21|2023-09-21|-| [See below](#datahub-infra-v212) |
|[Infra v2.13.1](https://github.com/ssc-sp/datahub-infra/tree/v2.13.1)|2023-10-03|2023-10-03|2023-10-04| [See below](#datahub-infra-v213) |


## Project Resource Modules
| Version | Release Date | Changes |
|---|---|---|
|[v2.12.0](https://github.com/ssc-sp/datahub-resource-modules/tree/versioning/modules/v2.12.0)| 22-Sep-2023 |[See below](#project-resource-module-v212)|
|[v2.13.0](https://github.com/ssc-sp/datahub-resource-modules/tree/versioning/modules/v2.13.0)| 04-Oct-2023 |[See below](#project-resource-module-v213)|

## Portal

| Version | Release Date | Changes |
|---|---|---|
|[v2.9.0](https://github.com/ssc-sp/datahub-resource-modules/tree/versioning/modules/v2.12.0)| 22-Sep-2023 |[See below](#project-resource-module-v212)|
|[v2.8.0](https://github.com/ssc-sp/datahub-resource-modules/tree/versioning/modules/v2.13.0)| 04-Oct-2023 |[See below](#project-resource-module-v213)|

## Changes

## Portal v2.11
- Prototype of enhanced search: You can now use the search bar to find users, workspaces, tutorials, etc.
- In-portal support: Support requests can be submitted directly through the Help button in FSDH. You no longer need to fill out a separate form.
- Improved Accessibility to ensure everyone can benefit from FSDH: Changed page hierarchies to improve results from screen readers.
- Bug fixes

## Portal v2.8

- Storage usage and cost reporting per workspace. Users can now see how much storage each workspace is using and what the total spend is.
- Featured workspaces are now on display and accessible for viewing on the Workspaces page. These are selected and posted by the FSDH team.
- Additional details have been to each workspace to display information about how many collaborators there are and to identify if there is any shared content.
- Hosting for R Shiny apps can be enabled in the workspaces and is available upon request.

### DataHub Infra v2.12
- Added automation account and currently to scale down app service plan at 8PM
- Add configuration `DesktopFileUploader__DisplayDesktopUploaderTab`
- Add secrets `ado-service-user-oid` and `ado-service-user-pat`

### DataHub Infra v2.13
- Add configuration `DesktopFileUploader__DisplayDesktopUploaderTab`
- Add secrets `ado-service-user-oid` and `ado-service-user-pat`
- Updated MS SQL database LTR policy

### Project Resource Module v2.13
- Added Azure file share (limit to 64GB) and map to app service 
- Grant secret scope permission to all Databricks users (except guests)

### Project Resource Module v2.12
- Removed user creation and group membership
- Remove storage role assignment from Terraform
- Both of the above are being delegated to a standalone function using Python to addresses the delays during user update
