---
remarks: Automatically translated with DeepL
source: /DeveloperGuide/Change-Management/Change-Log.md
draft: true
---

# Journal des modifications

## DataHub Core App
| Version | [DEV](https://dev.fsdh-dhsf.science.cloud-nuage.canada.ca/) | [INT](https://int.fsdh-dhsf.science.cloud-nuage.canada.ca/) | [POC](https://federal-science-datahub.canada.ca/) | Notes |
|---|---|---|---|---|
|[Infra v2.12-rc1](https://github.com/ssc-sp/datahub-infra/tree/v2.12-rc1)|2023-09-21|2023-09-21|-| [See below](#datahub-infra-v212) |

## Modules de ressources du projet
| Version | Date de sortie | Changements |
|---|---|---|
|[v2.12.0](https://github.com/ssc-sp/datahub-resource-modules/tree/versioning/modules/v2.12.0)| 22-Sep-2023 |[Voir ci-dessous](#projet-module-ressources-v212)|[Voir ci-dessous](#projet-module-ressources-v212)|[Voir ci-dessous](#projet-module-ressources-v212)
|[v2.13.0](https://github.com/ssc-sp/datahub-resource-modules/tree/2.13.x/modules/v2.13.0)| En attente |[Voir ci-dessous](#projet-module-de-ressources-v213)|

## Changements

### DataHub Infra v2.12
- Ajout d'un compte d'automatisation et réduction en cours du plan de service de l'application à 20h00
- Ajouter la configuration `DesktopFileUploader__DisplayDesktopUploaderTab`
- Ajouter les secrets `ado-service-user-oid` et `ado-service-user-pat`.

### Module de ressources de projet v2.13
- Ajout du partage de fichiers Azure (limité à 64GB) et du service map to app
- Accorder le droit d'accès au secret à tous les utilisateurs de Databricks (à l'exception des invités)

### Module de ressources de projet v2.12
- Suppression de la création d'utilisateurs et de l'appartenance à des groupes
- Supprimer l'affectation des rôles de stockage dans Terraform
- Les deux éléments ci-dessus sont délégués à une fonction autonome utilisant Python pour remédier aux retards lors de la mise à jour par l'utilisateur.
