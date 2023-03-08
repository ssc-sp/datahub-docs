## Azure Devops CD

This guide will walk you through the steps to setup Azure DevOps for DataHub.

## Create release pipelines

You will need to create a release pipeline for the following components:

- DataHub Portal
- DataHub Functions
- Resource Provisioner Functions

## Example release pipeline

The following is an example release pipeline for DataHub artifacts. You can use this as a reference to create your own release pipelines.

### DataHub Portal App

```yaml
#Your build pipeline references an undefined variable named ‘Parameters.ConnectedServiceName’. Create or edit the build pipeline for this YAML file, define the variable on the Variables tab. See https://go.microsoft.com/fwlink/?linkid=865972
#Your build pipeline references an undefined variable named ‘Parameters.WebAppKind’. Create or edit the build pipeline for this YAML file, define the variable on the Variables tab. See https://go.microsoft.com/fwlink/?linkid=865972
#Your build pipeline references an undefined variable named ‘Parameters.WebAppName’. Create or edit the build pipeline for this YAML file, define the variable on the Variables tab. See https://go.microsoft.com/fwlink/?linkid=865972

variables:
  - Parameters.WebAppKind: "windows"
  - Parameters.WebAppName: "fsdh-portal-app-env"

steps:
  - task: AzureRmWebAppDeployment@4
    displayName: "Deploy Azure App Service"
    inputs:
      azureSubscription: "$(Parameters.ConnectedServiceName)"
      appType: "$(Parameters.WebAppKind)"
      WebAppName: "$(Parameters.WebAppName)"
      packageForLinux: "$(System.DefaultWorkingDirectory)/_fsdh-app-build/datahub-portal/Datahub.Portal.zip"
  - task: AzureAppServiceSettings@1
    displayName: "Azure App Service Settings: fsdh-portal-app-int"
    inputs:
      azureSubscription: "AZRM - DataSolutions"
      appName: "fsdh-portal-app-int"
      resourceGroupName: "fsdh-int-rg"
      appSettings: |
        [
          {
            "name": "PortalVersion__Release",
            "value": "$(Build.BuildNumber)",
            "slotSetting": false
          },
          {
            "name": "PortalVersion__Commit",
            "value": "$(Build.SourceVersion)", 
            "slotSetting": false
          },
          {
            "name": "PortalVersion__BuildId",
            "value": "$(Build.BuildId)", 
            "slotSetting": false
          }
        ]
  - bash: |
      # Write your commands here

      echo 'Hello world'
      curl https://fsdh-portal-app-dev.azurewebsites.net/register
    displayName: "Bash Script"
    timeoutInMinutes: 15
    retryCountOnTaskFailure: 3
```

### DataHub Functions App

```yaml
variables:
  - Parameters.AzureSubscription: "00000000-0000-0000-0000-000000000000"
  - Parameters.AppType: "Function App on Windows"
  - Parameters.AppName: "fsdh-func-dotnet-env"

steps:
  - task: AzureFunctionApp@1
    displayName: "Deploy Azure Function App"
    inputs:
      azureSubscription: "$(Parameters.AzureSubscription)"
      appType: "$(Parameters.AppType)"
      appName: "$(Parameters.AppName)"
      package: "$(System.DefaultWorkingDirectory)/_fsdh-app-build/datahub-function/Datahub.Functions.zip"
```

### Resource Provisioner Functions App

```yaml
variables:
  - Parameters.AzureSubscription: "00000000-0000-0000-0000-000000000000"
  - Parameters.AppType: "Function App on Windows"
  - Parameters.AppName: "fsdh-func-res-prov-env"

steps:
  - task: AzureFunctionApp@1
    displayName: "Deploy Azure Function App"
    inputs:
      azureSubscription: "$(Parameters.AzureSubscription)"
      appType: "$(Parameters.AppType)"
      appName: "$(Parameters.AppName)"
      package: "$(System.DefaultWorkingDirectory)/_fsdh-app-build/resource-provisioner-function/ResourceProvisioner.Functions.zip"
```
