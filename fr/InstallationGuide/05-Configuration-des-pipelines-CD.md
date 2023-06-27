---
remarks: Automatically translated with DeepL
source: /InstallationGuide/05-CD-Pipelines-Setup.md
draft: true
---

## Azure Devops CD

Ce guide vous guidera à travers les étapes de la configuration d'Azure DevOps pour DataHub.

## Créer des pipelines de mise en production

Vous devrez créer un pipeline de diffusion pour les composants suivants :

- Portail DataHub
- Fonctions de DataHub
- Fonctions du fournisseur de ressources

## Exemple de pipeline de diffusion

Voici un exemple de pipeline de diffusion pour les artefacts DataHub. Vous pouvez l'utiliser comme référence pour créer vos propres pipelines de diffusion.

### Application du portail DataHub

``yaml
#Votre pipeline de construction fait référence à une variable non définie nommée 'Parameters.ConnectedServiceName'. Créez ou éditez le pipeline de construction pour ce fichier YAML, définissez la variable dans l'onglet Variables. Voir https://go.microsoft.com/fwlink/?linkid=865972
#Votre pipeline de construction fait référence à une variable non définie nommée 'Parameters.WebAppKind'. Créez ou éditez le pipeline de construction pour ce fichier YAML, définissez la variable dans l'onglet Variables. Voir https://go.microsoft.com/fwlink/?linkid=865972
#Votre pipeline de construction fait référence à une variable non définie nommée 'Parameters.WebAppName'. Créez ou modifiez le pipeline de construction pour ce fichier YAML, définissez la variable dans l'onglet Variables. Voir https://go.microsoft.com/fwlink/?linkid=865972

variables :
  - Parameters.WebAppKind : "windows"
  - Parameters.WebAppName : "fsdh-portal-app-env"

étapes :
  - tâche : AzureRmWebAppDeployment@4
    displayName : "Déployer Azure App Service"
    les entrées :
      azureSubscription : "$(Parameters.ConnectedServiceName)"
      appType : "$(Parameters.WebAppKind)"
      WebAppName : "$(Parameters.WebAppName)"
      packageForLinux : "$(System.DefaultWorkingDirectory)/_fsdh-app-build/datahub-portal/Datahub.Portal.zip"
  - tâche : AzureAppServiceSettings@1
    displayName : "Azure App Service Settings : fsdh-portal-app-int"
    les entrées :
      azureSubscription : "AZRM - DataSolutions"
      appName : "fsdh-portal-app-int"
      resourceGroupName : "fsdh-int-rg"
      appSettings : 
        [
          {
            "nom" : "PortalVersion__Release",
            "value" : "$(Build.BuildNumber)",
            "slotSetting" : faux
          },
          {
            "nom" : "PortalVersion__Commit",
            "value" : "$(Build.SourceVersion)",
            "slotSetting" : faux
          },
          {
            "name" : "PortalVersion__BuildId",
            "value" : "$(Build.BuildId)",
            "slotSetting" : faux
          }
        ]
  - bash : 
      # Ecrivez vos commandes ici

      echo 'Hello world'
      curl https://fsdh-portal-app-dev.azurewebsites.net/register
    nom d'affichage : "Bash Script"
    timeoutInMinutes : 15
    retryCountOnTaskFailure : 3
```

### DataHub Functions App

``yaml
variables :
  - Parameters.AzureSubscription : "00000000-0000-0000-0000-000000000000"
  - Parameters.AppType : "Function App on Windows"
  - Parameters.AppName : "fsdh-func-dotnet-env"

étapes :
  - tâche : AzureFunctionApp@1
    displayName : "Deploy Azure Function App"
    les entrées :
      azureSubscription : "$(Parameters.AzureSubscription)"
      appType : "$(Parameters.AppType)"
      appName : "$(Parameters.AppName)"
      package : "$(System.DefaultWorkingDirectory)/_fsdh-app-build/datahub-function/Datahub.Functions.zip"
```

### Fonctions du fournisseur de ressources App

``yaml
variables :
  - Parameters.AzureSubscription : "00000000-0000-0000-0000-000000000000"
  - Parameters.AppType : "Function App on Windows"
  - Parameters.AppName : "fsdh-func-res-prov-env"

étapes :
  - tâche : AzureFunctionApp@1
    displayName : "Deploy Azure Function App"
    les entrées :
      azureSubscription : "$(Parameters.AzureSubscription)"
      appType : "$(Parameters.AppType)"
      appName : "$(Parameters.AppName)"
      package : "$(System.DefaultWorkingDirectory)/_fsdh-app-build/resource-provisioner-function/ResourceProvisioner.Functions.zip"
```
