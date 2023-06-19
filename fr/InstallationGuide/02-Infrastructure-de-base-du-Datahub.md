---
remarks: Translation reviewed by DataHub team
source: /InstallationGuide/02-Datahub-Core-Infrastructure.md
draft: true
---

## Étape 2 : Configurer votre infrastructure DataHub (Core)

1. Clonez le référentiel de l'infrastructure DataHub (Core) sur votre machine locale.
1. Créez une nouvelle branche pour vos modifications.

1. Lancez `terraform init` pour initialiser le backend terraform.
1. Exécutez `terraform plan` pour vous assurer que l'infrastructure est configurée correctement.

### Créer le référentiel d'infrastructure DataHub (Projets)

1. Créez un nouveau référentiel dans votre organisation Azure DevOps.
1. Identifiez la structure des dossiers que vous souhaitez utiliser pour vos projets. Nous vous recommandons d'utiliser la structure suivante :

``bash
└───terraform
    ├────core
    │ ├────dev
    │ │ ├────main.tf
    │ │ ├─── ...
    │ │ └────terraform.tfvars
    │ ├────prod
    │ │ ├────main.tf
    │ │ ├─── ...
    │ │ └────terraform.tfvars
    │ └────staging
    │ ├────main.tf
    │ ├─── ...
    │ └────terraform.tfvars
    └────projets
        ├────ACRONYM1
        │ ├────main.tf
        │ ├─── ...
        │ └────project.tfbackend
        ├────ACRONYM2
        │ ├────main.tf
        │ ├─── ...
        │ └────project.tfbackend
        └─── ...

```

> Note : Le `ACRONYME` est l'acronyme du projet. Par exemple, l'acronyme du projet "Science Alpine Experimentation Project" serait "SAEP".
