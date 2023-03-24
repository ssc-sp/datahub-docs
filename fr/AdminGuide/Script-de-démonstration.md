---
remarks: Automatically translated with DeepL
source: /AdminGuide/Demo-Script.md
draft: true
---

# Script de démonstration pour DataHub

## Section 0 : Embarquement

Je ne suis pas sûr qu'il faille couvrir ce point...

## Section 1 : Présentation du portail

Fournir une vue d'ensemble du DataHub du programme scientifique. Principaux objectifs :
- des espaces de travail pour le stockage et la transformation
- l'accès au stockage
- le suivi du budget utilisé (quotidien et mensuel)
- espace de collaboration pour le partage des données et des carnets de notes python/r

### T&C et langue

- Condition préalable à l'entrée dans le portail. Des questions seront posées ultérieurement pour s'assurer que tous les points ont été lus.
- La langue peut être changée à l'intérieur du portail à l'aide du profil

### Qu'est-ce qu'un espace de travail ?

Fournir une vue d'ensemble du DataHub du programme scientifique. Principaux objectifs :
- des espaces de travail pour le stockage et la transformation
- l'accès au stockage
- le suivi du budget utilisé (quotidien et mensuel)
- espace de collaboration pour le partage des données et des carnets de notes python/r

### Métadonnées

Nécessaire pour accéder aux ressources
Accès unifié aux ressources Azure : Azure Storage (cas d'utilisation 1), Databricks pour R et Python (cas d'utilisation 2)

### Collaborateurs

Rôles de Datahub :
- administrateur
- propriétaire
- collaborateur

Les rôles sont également utilisés dans les banques de données pour les autorisations.

### Coût de revient de l'Azure

La page des coûts comprend tous les coûts, y compris le backend

Ce qui est cher :
- Temps passé sur le cluster
- Transferts de données importants (ingress + bandwitdth pour aller vers les centres de données Azure à partir de l'ordinateur de l'utilisateur)

Ce qui n'est pas cher :
- Aucun coût lorsque l'ordinateur portable n'est pas utilisé et que le cluster est éteint
- Conserver les données dans Azure = Hotel California. La plupart des coûts de stockage sont encourus lors du chargement et du déchargement des données hors d'Azure.

### Gestion des coûts

L'approche recommandée est de commencer à utiliser le DataHub avec un projet à petite échelle et de mesurer les coûts pendant une semaine :
- sélectionner un petit ensemble de données
- exécuter l'algorithme sur un petit ensemble de données et utiliser une semaine pour établir une base de référence
- utiliser la semaine de test pour estimer les coûts à plus long terme

Exemple de coûts :
- DIE1, DIE2, DIE3 : moins de 70 $/semaine
- NRC : grand cluster, 300Gb Ram > $1000/jour - coût principalement dû à l'utilisation d'un très grand cluster.

### Documentation intégrée

Faits marquants :
- Télécharger de gros fichiers avec `azcopy`
- Liste des ressources databricks pour python
- Liste des ressources databricks pour R

## Section 2 : Présentation de l'environnement Python/R

### Comment télécharger vos données vers Azure

Explorateur de stockage :
- télécharger des fichiers et des dossiers vers azure
- télécharger des fichiers

Compte de stockage accessible par un chemin spécial dans les bases de données, appelé point de montage.
- `/mnt/fsdh-dbk-main-mount`

### Sélection de la grappe

La sélection des clusters dans Databricks a été limitée à une sélection de nœuds d'exécution rentables (note : les nœuds utilisent des machines virtuelles dans le backend qui n'est pas accessible à l'utilisateur).

### Bibliothèques Python et R

- **Python:** Databricks permet d'accéder à des [librairies encadrées par le cahier] (https://docs.databricks.com/libraries/notebooks-python-libraries.html) en utilisant la commande spéciale `%pip`. Aucune limitation sur les bibliothèques disponibles = pypip. Les bibliothèques qui nécessitent des binaires natifs peuvent avoir certaines limitations.
- **R:** Databricks fournit un accès aux [notebook scoped libraries] (https://docs.databricks.com/libraries/notebooks-r-libraries.html) en utilisant la commande spéciale `install.packages` et `devtools::install_github` pour les bibliothèques github. Les snapshots CRAN sont recommandés.

### Databricks SQL Storage

En plus de Python et R - Databricks fournit un accès aux tables Hive standard qui permettent d'utiliser SQL sur les fichiers gérés stockés dans le compte de stockage Azure. Plus de détails sont disponibles dans la section des ressources.

### Carnet de démo

Les banques de données peuvent être utilisées pour :
- Transformations de données, ETL
- Apprentissage automatique
- Visualisations
- Accès au stockage
- Accès à l'API

### Ressources complémentaires

Montrer les ressources dans le portail pour en savoir plus sur les matrices de données.
