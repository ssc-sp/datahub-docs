---
remarks: Automatically translated with DeepL
source: /InstallationGuide/01-Create-Repositories.md
draft: true
---

## Étape 1 : Créer les référentiels d'infrastructure

Nous utilisons Azure DevOps pour gérer notre infrastructure, mais il n'y a aucune raison pour que vous n'utilisiez pas un autre dépôt git. Vous devrez créer deux dépôts :

> Note : Si vous n'avez pas d'organisation Azure DevOps, vous pouvez en créer une en suivant les instructions de [ce guide] (https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/create-organization?view=azure-devops).

- Un pour l'infrastructure DataHub (Core)
- Un pour les infrastructures du DataHub (projets)

> Note : Vous pouvez utiliser deux référentiels distincts pour les infrastructures DataHub (Core) et DataHub (Projects). Cependant, nous vous recommandons d'utiliser un seul référentiel d'infrastructure.

### Créer le référentiel du modèle d'infrastructure DataHub Core

1. Clonez le référentiel Datahub Infrastructure dans un nouveau référentiel de votre organisation Azure DevOps.
1. Configurez votre backend terraform comme vous le souhaitez. Nous recommandons d'utiliser Azure Storage comme backend.
1. Copiez le fichier `terraform.tfvars.example` dans `terraform.tfvars` et mettez à jour les valeurs avec les vôtres.
1. Lancez `terraform init` pour initialiser le backend terraform.
1. Exécutez `terraform plan` pour vous assurer que l'infrastructure est configurée correctement.
1. Exécutez `terraform apply` pour déployer l'infrastructure.

### Créer le référentiel de modèles d'infrastructure DataHub Projects

1. Créez un référentiel vide dans votre organisation Azure DevOps.
1. Créez le chemin du dossier `/terraform/projects/` dans le référentiel en créant un readme.md à ce chemin.
