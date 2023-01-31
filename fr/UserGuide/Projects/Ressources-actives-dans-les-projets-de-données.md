---
remarks: Automatically translated with DeepL
source: /UserGuide/Projects/Active-Resources-in-Data-Projects.md
---

_(draft documentation, please review)_

# Objectif

Récupérer la liste des ressources actives pour un projet en utilisant l'ID du projet.

## Attributs obligatoires

- URL de la ressource (databricks ou compte de stockage)
- Type de ressource (clé ?)
- Attributs des ressources

## Processus de mise à jour

1. Terraform exécute la mise à jour dans le pipeline DevOps
1. Terraform génère un fichier de sortie avec des variables
1. Le pipeline télécharge le fichier de sortie dans la file d'attente de stockage.
1. Queue de stockage des sondages TerraformOutputService
1. TerraformOutputService itère à travers les ressources générées.
   1. Pour chaque ressource
   1. TerraformOutputService analyse les valeurs Terraform dans le modèle d'objet ProjectResource.
   1. ProjectResource est sérialisée en JSON et stockée dans la base de données avec l'ID du projet, le `nom du module` comme clé, y compris l'ID du commit git du pipeline azure devops.

> _Note : `module name` doit correspondre exactement au dépôt git dans le dossier github avec les modules. La description sera récupérée de `https://github.com/ssc-sp/datahub-resource-modules/tree/develop/modules/<nom du module>/datahub.readme.md`_.
