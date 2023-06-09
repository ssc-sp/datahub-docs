---
remarks: Translation reviewed by DataHub team
source: /InstallationGuide/07-Resource-Provisioner-Functions.md
draft: true
---

## Fonctions du fournisseur de ressources

Ce guide vous aidera à vérifier l'installation des fonctions de Resource Provisioner dans votre locataire et à les configurer.

## Conditions préalables

Vous avez terminé les étapes précédentes du guide d'installation.

## Vérifier l'infrastructure

### Créer un graphique Fonction utilisateur

1. Naviguez sur le portail Azure et sélectionnez le groupe de ressources que vous avez créé pour l'infrastructure DataHub Core
1. Sélectionnez la fonction `fsdh-func-res-prov-env` app
1. Confirmer que l'application de la fonction est en cours d'exécution
   - Vérifier qu'il est sur le runtime `dotnet-isolated`.
   - Vérifier qu'il s'agit bien de dotnet 7.x

### Tableau de configuration

Le tableau suivant contient les informations de configuration des fonctions DataHub.

| Nom et valeur du secret de Keyvault Exemple : - Nom et valeur du secret de Keyvault
| ------------------------------------------------------- | ---------------------------------------------------------------------- | ----------------------------------------------- | -------------------------------------------------------- |
| `FUNCTIONS_WORKER_RUNTIME` | La durée d'exécution des fonctions DataHub | - | `dotnet-isolated` |
| `InfrastructureRepository__ApiVersion` | La version API d'ADO | - | `6.0` |
| `InfrastructureRepository__LocalPath` | Le chemin local du référentiel d'infrastructure | - | `/../tmp/datahub-projet-infrastructure-env` |
| `InfrastructureRepository__MainBranch` | La branche principale du référentiel d'infrastructure | - | `main` | `Main` | `InfrastructureRepository__MainBranch` | La branche principale du référentiel d'infrastructure
`InfrastructureRepository__Password` | Le mot de passe du compte de service dans ADO | `datahub-infrastructure-repo-password` | `xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx` | `datahub-infrastructure-repo-password` | `datahub-infrastructure-repo-password` | `xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx` |
| `InfrastructureRepository__ProjectPathPrefix` | Le préfixe du chemin du projet du Référentiel d'Infrastructure | - | `terraform/projets` |
| `InfrastructureRepository__PullRequestBrowserUrl` | URL du navigateur pour la pull request dans ADO | `datahub-infrastructure-repo-pr-browser-url` | `https://dev.azure.com/...` |
| `InfrastructureRepository\_PullRequestUrl` | L'URL de la pull request dans ADO | `datahub-infrastructure-repo-pr-url` | - |
| `InfrastructureRepository__Url` | URL du dépôt d'infrastructure | `datahub-infrastructure-repo-url` | `https://dev.azure.com/...` | `datahub-infrastructure-repo-url` | `datahub-infrastructure-repo-url` | `https://dev.azure.com/...`
| `InfrastructureRepository__Username` | Le nom d'utilisateur du compte de service dans ADO | `datahub-infrastructure-repo-username` | - | |
| `InfrastructureRepository__AutoApproveUserOid` | L'objet ID de l'utilisateur qui peut approuver automatiquement les pull requests | `datahub-infrastructure-repo-auto-approver-oid` | `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx` |
| `ModuleRepository__LocalPath` | Le chemin local du Référentiel de Modules | - | `/../tmp/datahub-resource-modules` |
| `ModuleRepository__TemplatePathPrefix` | Le préfixe du chemin du modèle du Référentiel de Modules | - | `templates/` |
| `ModuleRepository__Url` | L'URL pour le dépôt de modules | - | `https://github.com/ssc-sp/datahub-resource-modules.git` |
| `ResourceRunRequestConnectionString` | La chaîne de connexion pour le compte de stockage | `datahub-storage-queue-conn-str` | `DefaultEndpointsProtocol=https...` |
| `Terraform__Backend__ResourceGroupName` | Le nom du groupe de ressources du compte de stockage pour contenir l'état terraform | - | `fsdh-env-rg` |
| `Terraform__Variables__az_location` | Emplacement des ressources | - | `canadacentral` | `Terraform__Variables__az_location` | Emplacement des ressources
| `Terraform__Variables__az_subscription_id` | L'identifiant d'abonnement des ressources | - | `xxxxxxxx-xxxx-xxxx-xxxxxxxx-xxxxxxxx` |
| `Terraform__Variables__az_tenant_id` | L'identifiant du locataire des ressources | - | `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx` |
| `Terraform__Variables__azure_databricks_enterprise_oid` | L'ID de l'objet Databricks Enterprise | `datahub-databricks-sp` | `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx` | `datahub-databricks-sp` | `datahub-databricks-sp` | `xxxxxxxx-xxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx` |
| `Terraform__Variables__common_tags` | Les balises communes pour les ressources | - | `{"environment" : "dev", "owner" : "datahub"}` |
| `Terraform__Variables__datahub_app_sp_oid` | L'objet ID du DataHub App Service Principal | - | `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxx` |
| `Terraform__Variables__environment_classification` | Classification environnementale des ressources | - | `U` | `Terraform__Variables__environment_classification` | `Terraform__Variables__environment_classification
| `Terraform__Variables__environment_name` | Le nom de l'environnement des ressources | - | `dev` |
| `Terraform__Variables__resource_prefix` | Le préfixe des ressources | - | `fsdh` |

### Définition des secrets de la chambre forte

1. Naviguez sur le portail Azure et sélectionnez le groupe de ressources que vous avez créé pour l'infrastructure DataHub Core
1. Sélectionnez l'espace de stockage des clés `fsdh-kv-env`.
1. Confirmer que les secrets suivants sont présents
   - [ ] `datahub-databricks-sp`
   - [ ] `datahub-infrastructure-repo-password`
   - [ ] `datahub-infrastructure-repo-pr-browser-url`
   - [ ] `datahub-infrastructure-repo-pr-url`
   - [ ] `datahub-infrastructure-repo-url`
   - [ ] `datahub-infrastructure-repo-username`
   - [ ] `datahub-storage-queue-conn-str`

### Exemple de script

Connectez-vous avec le principal de service que vous avez créé dans les étapes précédentes.

``powershell
az login --service-principal --username $servicePrincipalId --password $servicePrincipalPassword --tenant $tenantId
```

Définir les secrets du coffre-fort

``powershell
$keyVaultName = "fsdh-key-env" (nom du coffre-fort)

az keyvault secret set --vault-name $keyVaultName --name "datahub-databricks-sp" --value "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx".
az keyvault secret set --vault-name $keyVaultName --name "datahub-infrastructure-repo-password" --value "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx".
az keyvault secret set --vault-name $keyVaultName --name "datahub-infrastructure-repo-pr-browser-url" --value "https://dev.azure.com/..."
az keyvault secret set --vault-name $keyVaultName --name "datahub-infrastructure-repo-pr-url" --value "https://dev.azure.com/..."
az keyvault secret set --vault-name $keyVaultName --name "datahub-infrastructure-repo-url" --value "https://dev.azure.com/..."
az keyvault secret set --vault-name $keyVaultName --name "datahub-infrastructure-repo-username" --value "..."
az keyvault secret set --vault-name $keyVaultName --name "datahub-infrastructure-repo-auto-approver-oid" --value "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
az keyvault secret set --vault-name $keyVaultName --name "datahub-storage-queue-conn-str" --value "DefaultEndpointsProtocol=https..."
```
