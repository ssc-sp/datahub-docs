---
remarks: Automatically translated with DeepL
source: /InstallationGuide/00-Preparation.md
draft: true
---

## Étape 0 : Préparation

Avant d'installer DataHub, vous devez configurer votre zone d'atterrissage. Assurez-vous de connaître les informations suivantes avant de commencer le processus d'installation :

### Infrastructure

- ID du locataire Azure (GUID)
- ID de l'abonnement Azure (GUID)
- Nom de domaine Azure AD (par exemple, contoso.com)
- Nom de domaine personnalisé (par exemple datahub.com)
- Nom du groupe Azure AD pour les administrateurs d'applications (par exemple, DataHub Admins)
- Nom du groupe Azure AD pour les administrateurs de bases de données d'application (par exemple, les administrateurs de bases de données DataHub)
- Nom du groupe Azure AD pour les utilisateurs de l'application (par exemple, utilisateurs de DataHub)
- DNS du domaine public pour l'accès externe (par ex. external.datahub.com)
- Si vous souhaitez utiliser l'authentification MSI pour le fournisseur Databricks (par exemple, exécuter à partir d'Azure DevOps).
- [ ] Databricks Enterprise Object ID (GUID)
- [ ] Cosmos DB Enterprise Object ID (GUID)

### Portail

- Nom du groupe de ressources Azure
- Préfixe de la ressource (par exemple fsdh)
- Nom et identifiant du coffre-fort de la clé principale
- Courriel du contact d'assistance
- [ ] PowerBI URL SPI (e.g. https://api.powerbi.com/v1.0/myorg)
- URL de PowerBI PDF Viewer (par exemple https://app.powerbi.com/viewer)

### SMTP

- Nom d'hôte SMTP
- Port SMTP
- Nom de l'expéditeur SMTP
- [ ] SMTP Email de l'expéditeur

### OpenData

- Nom de l'approbateur OpenData
- Email de l'approbateur OpenData
- URL de l'API OpenData (par exemple https://api.data.gov.sg/v1/environment/2-hour-weather-forecast)
