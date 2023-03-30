---
remarks: Automatically translated with DeepL
source: /AdminGuide/Demo-Script.md
draft: true
---

# Section 0 : Onboarding et Login

**Prep:** Sign out

1. Ouvrez https://federal-science-datahub.canada.ca
2. Sur l'écran de connexion, indiquez que vous utilisez le compte et le mot de passe de MS Teams, qui peuvent être différents de ceux de votre réseau.
3. Mentionnez que l'écran de connexion sera différent pour chaque département. L'authentification dans DataHub s'appuie sur l'AAD existant.

# Section 1 : Présentation du portail

## Conditions générales et langue

Avant d'entrer dans le portail Federal Science DataHub, vous devez suivre deux étapes importantes.

1. **Vous devez sélectionner une langue pour le portail**. Cette sélection de langue vous permet de naviguer et d'utiliser facilement la plateforme dans la langue de votre choix.

1. **Vous devez accepter les conditions générales** qui régissent l'utilisation de la plateforme. Il s'agit d'une condition essentielle pour accéder aux fonctionnalités et aux avantages de DataHub.

Une fois que vous aurez sélectionné une langue et accepté les conditions générales, vous aurez accès au portail.

> Il est intéressant de noter que **vous pouvez passer d'une langue à l'autre** à l'intérieur du portail en utilisant votre profil. Cette fonction vous permet de modifier vos préférences linguistiques à tout moment.

## Qu'est-ce qu'un espace de travail ?

Le Federal Science DataHub est une plateforme puissante qui offre **quatre objectifs principaux aux scientifiques et aux chercheurs**. Ces objectifs sont les suivants :

1. **La plateforme offre des espaces de travail pour le stockage, le traitement des données et l'analyse**. Cela signifie que vous pouvez stocker, traiter et analyser vos données dans un environnement cloud sécurisé.

1. **DataHub offre un moyen de contrôler votre budget utilisé et de le suivre sur une base quotidienne et mensuelle**. Cela vous aide à suivre vos dépenses et à rester dans les limites de votre budget.

1. **La plateforme Federal Science DataHub offre également un espace de collaboration pour le partage des données et des carnets python/r**. Cela vous permet de travailler avec des collègues et des homologues d'autres ministères et agences, de partager des idées et d'améliorer l'efficacité de votre travail.

## Métadonnées

Pour accéder aux ressources Azure fournies par le Science Program DataHub, une condition importante doit être remplie pour Azure Storage (cas d'utilisation 1) et Azure Databricks (cas d'utilisation 2).

**Vous devez compléter les métadonnées** de votre espace de travail afin d'avoir accès à des ressources spécifiques au sein de la plateforme. Il s'agit d'une exigence unique qui vous permettra d'accéder aux ressources unifiées d'Azure.

> Les métadonnées sont un ensemble de données qui décrivent et donnent des informations sur d'autres données. Dans le contexte du DataHub, les métadonnées sont utilisées pour décrire les données et le code que vous stockez dans votre espace de travail.

## Collaborateurs

Rôles de Datahub :

- plomb
- administrateur
- collaborateur

Les rôles sont également utilisés dans les banques de données pour les autorisations.

Dans le Federal Science DataHub, trois rôles principaux sont utilisés pour gérer les accès et les permissions. Ces rôles sont les suivants :

1. **Le rôle de responsable d'espace de travail** est le niveau d'accès le plus élevé dans un espace de travail. Les responsables d'espace de travail sont les propriétaires de l'espace de travail et ont la possibilité de gérer et de créer des ressources, ainsi que d'accorder ou de révoquer l'accès à d'autres utilisateurs.

1. **L'administrateur de l'espace de travail est responsable de la gestion des ressources de l'espace de travail, y compris les données et les métadonnées. Les administrateurs peuvent également gérer l'accès des utilisateurs, créer des ressources en nuage et consulter les rapports d'utilisation du budget.

1. **Le rôle de collaborateur de l'espace de travail** est conçu pour les utilisateurs qui ont besoin de travailler sur des projets et de contribuer à la recherche, mais qui n'ont pas besoin d'un accès administratif complet. Les collaborateurs peuvent accéder aux projets, télécharger des données et effectuer des analyses de données, mais ils ne peuvent pas gérer les ressources de l'espace de travail ni accorder l'accès à d'autres utilisateurs.

> Il convient de noter que ces rôles sont également utilisés dans Databricks pour les autorisations. Cela signifie que les mêmes rôles s'appliquent lorsque l'on travaille avec Databricks, ce qui garantit que les autorisations et l'accès sont cohérents sur l'ensemble de la plateforme.

## Azure Costing

La page des coûts comprend tous les coûts, y compris le backend

Ce qui est cher :

- Temps passé sur le cluster
- Transferts de données importants (ingress + bandwitdth pour aller vers les centres de données Azure à partir de l'ordinateur de l'utilisateur)

Ce qui n'est pas cher :

- Aucun coût lorsque l'ordinateur portable n'est pas utilisé et que le cluster est éteint
- Conserver les données dans Azure = Hotel California. La plupart des coûts de stockage sont encourus lors du chargement et du déchargement des données hors d'Azure.

La page de calcul des coûts de votre espace de travail fournit une vue d'ensemble de tous les coûts associés à l'utilisation des ressources en nuage. Cela inclut les coûts de l'espace de travail qui sont nécessaires pour assurer son fonctionnement en toute sécurité.

Certains facteurs peuvent avoir un impact sur le coût d'utilisation. Examinons de plus près ce qui est coûteux et ce qui ne l'est pas lors de l'utilisation de la plateforme :

### Ce qui est cher

- Le temps passé sur un cluster actif** peut être coûteux. En effet, les clusters nécessitent des ressources, telles que l'unité centrale et la mémoire, qui sont facturées à la minute. Par conséquent, plus une grappe est active longtemps et plus elle est grande, plus elle peut être coûteuse.

- Les transferts de données importants** peuvent également être coûteux. Il s'agit des coûts d'entrée et de sortie pour déplacer les données de l'ordinateur d'un utilisateur vers les centres de données d'Azure ou pour les redescendre. Ces coûts peuvent s'accumuler rapidement, en particulier pour les grands ensembles de données.

### Ce qui n'est pas cher

- Il n'y a pas de coût lorsque les grappes sont éteintes**. Un ordinateur portable ne fonctionne pas sur une grappe active lorsque celle-ci est éteinte. Cela signifie que les utilisateurs peuvent faire des économies en éteignant leurs clusters lorsqu'ils ne sont pas utilisés.

- La conservation des données au sein de l'écosystème Azure** peut également contribuer à réduire les coûts. La plupart des coûts de stockage sont encourus lorsque les données sont chargées ou téléchargées à partir d'Azure. Par conséquent, si les données sont conservées dans l'écosystème Azure, les coûts supplémentaires sont minimes.

**Sans crédits** : Nous n'accorderons pas plus de crédits - la situation sera évaluée au cas par cas et nous vous aiderons à transférer les données ailleurs si nécessaire.
> Les coûts sont partagés entre les collaborateurs.

## Gestion des coûts

L'approche recommandée pour commencer à utiliser efficacement le DataHub est de commencer par un projet à petite échelle et de mesurer les coûts associés pendant une semaine.

- Sélectionnez un petit ensemble de données** représentatif de l'ensemble de données plus large qui sera utilisé dans le projet. Ce petit ensemble de données doit être suffisamment petit pour que l'algorithme puisse être exécuté rapidement, mais suffisamment grand pour fournir une représentation réaliste de l'ensemble de données plus large.

- Exécutez l'algorithme sur le petit ensemble de données** et utilisez la **première semaine** de travail pour établir une base de référence pour les coûts du projet. Il s'agira de mesurer les ressources nécessaires à l'exécution de l'algorithme, telles que le temps de l'unité centrale, l'utilisation de la mémoire et la bande passante du réseau, ainsi que tous les coûts associés, tels que les coûts de stockage ou de transfert des données.

- Utiliser une semaine de test pour estimer les coûts à plus long terme** une fois que la base de référence a été établie. Il s'agit d'extrapoler les coûts de la semaine de référence pour estimer les coûts de l'ensemble du projet. Cela permet d'obtenir une estimation plus précise des coûts globaux du projet et d'identifier les mesures d'économie potentielles qui peuvent être mises en œuvre pour réduire le coût global du projet.

### Coûts de l'échantillon

Nous avons exécuté quelques projets types pour démontrer les coûts associés à l'utilisation de la plateforme, et nous avons fourni les résultats ci-dessous.

> Ces résultats sont basés sur les coûts encourus par l'équipe DataHub du programme scientifique et ne sont donnés qu'à titre indicatif.

- DIE1, DIE2, DIE3 : moins de 70 $/semaine
- NRC : grand cluster, 300Gb Ram > $1000/jour - coût principalement dû à l'utilisation d'un très grand cluster.

## Documentation intégrée

L'un des points forts du Federal Science DataHub est la **documentation intégrée**, qui facilite la compréhension et la navigation dans les capacités de la plateforme :

- Téléchargement et chargement de fichiers volumineux sur un support de stockage en utilisant `azcopy`**. Cette fonctionnalité est particulièrement utile pour les utilisateurs qui ont besoin de transférer des fichiers volumineux entre différents emplacements de stockage ou systèmes. La documentation fournit des instructions détaillées sur la manière d'utiliser azcopy pour transférer des fichiers volumineux et gérer efficacement le stockage.

- **Liste de ressources databricks pour python et R**. Cette liste comprend diverses ressources telles que des bibliothèques, des paquets et des modules qui peuvent être utilisés en python pour manipuler et analyser des données. Ces ressources peuvent être utilisées pour construire des modèles sophistiqués d'apprentissage automatique, effectuer des analyses de données et générer des rapports pertinents. La documentation fournit des instructions détaillées sur l'installation et l'utilisation efficace de ces ressources.

**Formation** : Les connaissances existantes en R et Python devraient être suffisantes pour travailler avec la plateforme. Formation sur d'autres fonctionnalités de databricks

# Section 2 : Aperçu de l'environnement Python/R

## Qu'est-ce que Databricks ?

Databricks est une plateforme gérée qui prend en charge les ordinateurs portables Python et R et une infrastructure Hadoop/Hive standard pour le traitement des données volumineuses. La plateforme Databricks sépare le notebook et l'infrastructure pour exécuter le code. Le code (SQL, Python et R) est exécuté sur des clusters et les tables SQL structurées utilisent le stockage Azure standard.

## Comment télécharger vos données vers Azure

> Nous supposons que les données sont disponibles localement et peuvent être téléchargées sur Azure. Si les données sont déjà sur Azure, veuillez nous contacter pour trouver une solution afin de limiter les coûts d'entrée et de sortie.

Explorateur de stockage :

- télécharger des fichiers et des dossiers vers azure
- télécharger des fichiers

Compte de stockage accessible par un chemin spécial dans les bases de données, appelé point de montage.

- `/mnt/fsdh-dbk-main-mount`

L'une des fonctionnalités disponibles pour les deux cas d'utilisation est le **Storage Explorer**, qui fournit une interface conviviale pour gérer le stockage en nuage. Cette fonctionnalité permet aux utilisateurs de télécharger des fichiers et des dossiers vers le stockage Azure et d'en extraire des fichiers en toute simplicité. Grâce à cette fonctionnalité, les utilisateurs peuvent gérer leurs ressources de stockage de manière transparente, ce qui facilite l'accès et la manipulation des données stockées dans le nuage.

**Il existe un chemin spécial dans Databricks connu sous le nom de point de montage**. Le point de montage est un chemin virtuel qui permet aux utilisateurs d'accéder à leurs ressources de stockage comme si elles faisaient partie du système de fichiers Databricks. Cela permet d'avoir une vue unifiée des données stockées dans Azure, ce qui facilite l'accès et la manipulation des données dans l'environnement Databricks.

**Le point de montage pour le compte de stockage dans Azure est `/mnt/fsdh-dbk-main-mount`**. Ce point de montage fournit un accès au compte de stockage, permettant aux utilisateurs de lire, écrire et modifier les fichiers stockés dans le compte de stockage Azure en utilisant les commandes standard du système de fichiers dans Databricks.

Grâce à cette configuration automatique, vous pouvez accéder de manière transparente à vos données entre le compte de stockage dans Azure et Databricks. En outre, le point de montage permet aux utilisateurs d'effectuer diverses tâches de traitement des données, telles que la manipulation, le nettoyage et l'analyse des données stockées dans le nuage, sans avoir à copier les données sur la machine locale ou le cluster.

## Sélection de la grappe

La sélection des clusters dans Databricks a été limitée à une sélection de nœuds d'exécution rentables (note : les nœuds utilisent des machines virtuelles dans le backend qui n'est pas accessible à l'utilisateur).

## Bibliothèques Python et R

- **Python:** Databricks permet d'accéder à des [librairies encadrées par le cahier] (https://docs.databricks.com/libraries/notebooks-python-libraries.html) en utilisant la commande spéciale `%pip`. Aucune limitation sur les bibliothèques disponibles = pypip. Les bibliothèques qui nécessitent des binaires natifs peuvent avoir certaines limitations.
- **R:** Databricks fournit un accès aux [notebook scoped libraries] (https://docs.databricks.com/libraries/notebooks-r-libraries.html) en utilisant la commande spéciale `install.packages` et `devtools::install_github` pour les bibliothèques github. Les snapshots CRAN sont recommandés.

## Databricks SQL Storage

En plus de Python et R - Databricks fournit un accès aux tables Hive standard qui permettent d'utiliser SQL sur les fichiers gérés stockés dans le compte de stockage Azure. Plus de détails sont disponibles dans la section des ressources.

## Carnet de démo

Les banques de données peuvent être utilisées pour :

- Transformations de données, ETL
- Apprentissage automatique
- Visualisations
- Accès au stockage
- Accès à l'API

## Ressources supplémentaires

Montrer les ressources dans le portail pour en savoir plus sur les matrices de données.
