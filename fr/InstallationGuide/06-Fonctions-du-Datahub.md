---
remarks: Automatically translated with DeepL
source: /InstallationGuide/06-Datahub-Functions.md
draft: true
---

## Fonctions Datahub

Ce guide vous guidera à travers les étapes pour vérifier l'installation des fonctions DataHub dans votre locataire et comment les configurer.

## Conditions préalables

Vous avez terminé les étapes précédentes du guide d'installation.

## Vérifier l'infrastructure

### Créer un graphique Fonction utilisateur

1. Naviguez sur le portail Azure et sélectionnez le groupe de ressources que vous avez créé pour l'infrastructure DataHub Core
1. Sélectionnez la fonction `fsdh-func-dotnet-env` app
1. Confirmer que l'application de la fonction est en cours d'exécution
   - Vérifier qu'il est sur le runtime `dotnet-isolated`.
   - Vérifier qu'il s'agit bien de dotnet 7.x
1. Vérifiez la fonction CreateGraphUser en naviguant vers la fonction `CreateGraphUser`.
   1. Sélectionnez l'onglet Vue d'ensemble
   1. Cliquez sur le bouton `Get Function Url` (Obtenir l'URL de la fonction)
   1. Vérifiez que l'URL de la fonction correspond à la valeur du secret `datahub-create-graph-user-url` de l'AKV de l'infrastructure centrale

### Tableau de configuration

Le tableau suivant contient les informations de configuration des fonctions DataHub.

| Nom et valeur du secret de Keyvault Exemple : - Nom et valeur du secret de Keyvault
| ---------------------------------- | -------------------------------------------------------------------- | -------------------------------- | -------------------------------------- |
| `datahub-mssql-project` | La chaîne de connexion de la base de données SQL pour les projets DataHub | - | `Server=tcp :... ` |
| `DatahubStorageConnectionString` | Chaîne de connexion pour le compte de stockage | `datahub-storage-queue-conn-str` | `DefaultEndpointsProtocol=https...` |
`EmailNotification__SenderAddress` | L'adresse électronique de l'expéditeur | - | - | |
`EmailNotification__SenderName` | Le nom de l'expéditeur | - | - | |
`EmailNotification__SmtpHost` | L'hôte SMTP | - | - | |
| `EmailNotification__SmtpPassword` | Le mot de passe SMTP | `datahub-smtp-password` | - | |
| `EmailNotification__SmtpPort` | Le port SMTP | - | - - |
| `EmailNotification__SmtpUsername` | Le nom d'utilisateur SMTP | `datahub-smtp-username` | - | |
| `FUNC_SP_ILCENT_ID` | L'ID du client du principal de service pour les fonctions DataHub.
| `FUNC_SP_ILCENT_SECRET` | Le secret du client du principal de service pour les fonctions DataHub.
| `FUNCTIONS_WORKER_RUNTIME` | La durée d'exécution des fonctions DataHub | - | `dotnet-isolated` |
| `PORTAL_URL` | L'URL du portail DataHub | - | - - |
| `ProjectUsageCRON` | L'expression CRON pour la fonction ProjectUsage | - | `0 0 2 * * *` |
| `ProjectUsageNotificationPercents` | Les pourcentages pour la fonction ProjectUsageNotification | - | `25,50,80,100` |
| `QueueueEmailNotification` | Le nom de la file d'attente de notification par courrier électronique | - | `email-notification` |
| `QueueueProjectUsageNotification` | Le nom de la file d'attente de notification d'utilisation du projet | - | `project-usage-notification` |
| `QueueueProjectUsageUpdate` | Le nom de la file d'attente de mise à jour de l'utilisation du projet | - | `project-usage-update` |
| `SP_GROUP_ID` | L'OID du groupe pour les utilisateurs du datahub dans l'AAD.
| `SUBSCRIPTION_ID` | L'ID de l'abonnement aux fonctions DataHub | - | `00000000-0000-0000-0000-00000000` |
`TENANT_ID` | ID du locataire des fonctions DataHub | - | `00000000-0000-0000-0000-00000000` | `TENANT_ID` | ID du locataire des fonctions DataHub
