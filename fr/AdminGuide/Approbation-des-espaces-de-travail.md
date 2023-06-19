---
remarks: Translation reviewed by DataHub team
source: /AdminGuide/Approving-Workspaces.md
draft: true
---

# Approbation des espaces de travail

## Pull Requests

Les nouveaux espaces de travail génèrent une demande d'extraction au sein du DevOps.

L'ouverture de la page [DevOps Active Pull Requests for Dev](https://dev.azure.com/science-program/DataHub%20SPC/_git/datahub-project-infrastructure-dev/pullrequests?_a=active) ou [DevOps Active Pull Requests for Int](https://dev.azure.com/science-program/DataHub%20SPC/_git/datahub-project-infrastructure-int/pullrequests?_a=active) permet d'obtenir la liste de tous les changements d'infrastructure demandés.

## Pipelines

Une fois le PR approuvé, il déclenchera les pipelines Terraform :

### Dev

Le pipeline terraform s'appelle [`fsdh-dev-project-release-v0.1.x`] (https://dev.azure.com/science-program/DataHub%20SPC/_release?definitionId=22&view=mine&_a=releases)

### Int

Le pipeline terraform s'appelle [`fsdh-release-int-v1.1.x`] (https://dev.azure.com/science-program/DataHub%20SPC/_release?_a=releases&view=mine&definitionId=23)
