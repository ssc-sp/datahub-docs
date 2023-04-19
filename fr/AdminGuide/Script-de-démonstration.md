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

# Section 1 : Présentation du portail et de l'espace de travail

## Conditions générales et langue

Avant d'entrer dans le portail DataHub scientifique fédéral, vous devez suivre deux étapes importantes.

1. **Vous devez sélectionner une langue pour le portail**. Cette sélection de langue vous permet de naviguer et d'utiliser facilement la plateforme dans la langue de votre choix.

1. **Vous devez accepter les conditions générales** qui régissent l'utilisation de la plateforme. Il s'agit d'une condition essentielle pour accéder aux fonctionnalités et aux avantages de DataHub.

Une fois que vous aurez sélectionné une langue et accepté les conditions générales, vous aurez accès au portail.

> Il est intéressant de noter que **vous pouvez passer d'une langue à l'autre** à l'intérieur du portail en utilisant votre profil. Cette fonction vous permet de modifier vos préférences linguistiques à tout moment.

> Des bannières d'aide apparaissent en haut du portail pour vous aider à naviguer et à utiliser la plateforme. Ces bannières sont disponibles en anglais et en français et peuvent être désactivées à tout moment.

## Qu'est-ce qu'un espace de travail ?

Le DataHub scientifique fédéral est une plateforme puissante qui offre **trois objectifs principaux aux scientifiques et aux chercheurs** :

1. **La plateforme offre des espaces de travail pour le stockage, le traitement des données et l'analyse**. Cela signifie que vous pouvez stocker, traiter et analyser vos données dans un environnement cloud sécurisé.

1. **DataHub offre un moyen de contrôler l'utilisation de votre budget et de suivre vos dépenses sur une base quotidienne et mensuelle**. Cela vous aide à suivre vos dépenses et à rester dans les limites de votre budget.

1. **La plateforme DataHub scientifique fédéral offre également un espace de collaboration pour le partage des données et des carnets python/r**. Cela vous permet de travailler avec des collègues et des homologues d'autres ministères et agences, de partager des idées et d'améliorer l'efficacité de votre travail.

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

Dans le DataHub scientifique fédéral, trois rôles principaux sont utilisés pour gérer les accès et les permissions. Ces rôles sont les suivants :

1. **Le rôle de responsable d'espace de travail** est le niveau d'accès le plus élevé dans un espace de travail. Les responsables d'espace de travail sont les propriétaires de l'espace de travail et ont la possibilité de gérer et de créer des ressources, ainsi que d'accorder ou de révoquer l'accès à d'autres utilisateurs.

1. **L'administrateur de l'espace de travail est responsable de la gestion des ressources de l'espace de travail, y compris les données et les métadonnées. Les administrateurs peuvent également gérer l'accès des utilisateurs, créer des ressources en nuage et consulter les rapports d'utilisation du budget.

1. **Le rôle de collaborateur de l'espace de travail** est conçu pour les utilisateurs qui ont besoin de travailler sur des projets et de contribuer à la recherche, mais qui n'ont pas besoin d'un accès administratif complet. Les collaborateurs peuvent accéder aux projets, télécharger des données et effectuer des analyses de données, mais ils ne peuvent pas gérer les ressources de l'espace de travail ni accorder l'accès à d'autres utilisateurs.

> Il convient de noter que ces rôles sont également utilisés dans Databricks pour les autorisations. Cela signifie que les mêmes rôles s'appliquent lorsque l'on travaille avec Databricks, ce qui garantit que les autorisations et l'accès sont cohérents sur l'ensemble de la plateforme.

> La synchronisation des autorisations entre le portail et Databricks peut prendre quelques minutes. Si vous n'arrivez pas à accéder à Databricks, attendez quelques minutes et réessayez. Si vous n'arrivez toujours pas à accéder à Databricks, veuillez remplir un formulaire de demande de support.

## Azure Costing

La page de calcul des coûts de votre espace de travail fournit une vue d'ensemble de tous les coûts associés à l'utilisation de vos ressources en nuage. Cela inclut les coûts de l'espace de travail qui sont nécessaires pour assurer son fonctionnement en toute sécurité.

Certains facteurs peuvent avoir un impact sur le coût d'utilisation. Je vais faire un rapide tour d'horizon de ce qui est coûteux et de ce qui ne l'est pas lors de l'utilisation de la plateforme :

### Ce qui est cher

- Le temps passé sur un cluster actif** peut être coûteux. En effet, les clusters nécessitent des ressources, telles que l'unité centrale et la mémoire, qui sont facturées à la minute. Par conséquent, plus une grappe est active longtemps et plus elle est grande, plus elle peut être coûteuse.

- Les transferts de données importants** peuvent également être coûteux. Il s'agit des coûts d'entrée et de sortie pour déplacer les données de l'ordinateur d'un utilisateur vers les centres de données d'Azure ou pour les redescendre. Ces coûts peuvent s'accumuler rapidement, en particulier pour les grands ensembles de données.

### Ce qui n'est pas cher

- Il n'y a pratiquement aucun coût lorsque les grappes sont éteintes** et que les ordinateurs portables ne fonctionnent pas sur des grappes actives. Cela signifie que les utilisateurs peuvent économiser des coûts en éteignant leurs clusters lorsqu'ils ne sont pas utilisés.

- La conservation des données au sein de l'écosystème Azure** peut également contribuer à réduire les coûts. La plupart des coûts de stockage sont encourus lorsque les données sont chargées ou téléchargées à partir d'Azure. Si les données sont montées et conservées dans l'écosystème Azure, les coûts supplémentaires sont minimes.

**Plus de crédits** : Nous n'accorderons pas de crédits supplémentaires - la situation sera évaluée au cas par cas et nous vous aiderons à transférer les données ailleurs si nécessaire. N'oubliez pas que le coût est partagé entre vos collaborateurs.

## Gestion des coûts

L'approche recommandée pour commencer à utiliser efficacement le DataHub est de commencer par un projet à petite échelle et de mesurer les coûts associés pendant une semaine.

- Sélectionnez un petit ensemble de données** représentatif de l'ensemble de données plus large qui sera utilisé dans le projet. Ce petit ensemble de données doit être suffisamment petit pour que l'algorithme puisse être exécuté rapidement, mais suffisamment grand pour fournir une représentation réaliste de l'ensemble de données plus large.

- Exécutez l'algorithme sur le petit ensemble de données** et utilisez la **première semaine** de travail pour établir une base de référence pour les coûts du projet. Il s'agira de mesurer les ressources nécessaires à l'exécution de l'algorithme, telles que le temps de l'unité centrale, l'utilisation de la mémoire et la bande passante du réseau, ainsi que tous les coûts associés, tels que les coûts de stockage ou de transfert des données.

- Utilisez une semaine de test pour estimer les coûts à plus long terme** une fois que la base de référence a été établie. Cela permettra d'obtenir une estimation plus précise des coûts globaux du projet et d'identifier les mesures d'économie potentielles qui peuvent être mises en œuvre pour réduire le coût global du projet.

### Coûts de l'échantillon

Nous avons mené quelques projets types pour démontrer les coûts associés à l'utilisation de la plateforme, et nous avons constaté que pour les petits ensembles de données, les coûts sont inférieurs à 70 $/semaine. Pour des ensembles de données plus importants, les coûts peuvent être supérieurs à 1000 $/jour.

> Ces résultats sont basés sur les coûts encourus par l'équipe DataHub du programme scientifique et ne sont donnés qu'à titre indicatif.

- DIE1, DIE2, DIE3 : moins de 70 $/semaine
- NRC : grand cluster, 300Gb Ram > $1000/jour - coût principalement dû à l'utilisation d'un très grand cluster.

# Section 2 : Vue d'ensemble des outils de l'espace de travail

## Qu'est-ce que Databricks ?

Databricks est une plateforme gérée qui prend en charge les ordinateurs portables Python et R et une infrastructure Hadoop/Hive standard pour le traitement des données volumineuses. La plateforme Databricks sépare le notebook et l'infrastructure pour exécuter le code. Le code (SQL, Python et R) est exécuté sur des clusters et les tables SQL structurées utilisent le stockage Azure standard.

## Comment télécharger vos données vers Azure et/ou Databricks

L'une des fonctionnalités disponibles pour les deux cas d'utilisation est le **Storage Explorer**, qui fournit une interface conviviale pour gérer le stockage en nuage. Cette fonctionnalité permet aux utilisateurs de télécharger des fichiers et des dossiers vers le stockage Azure et de télécharger des fichiers à partir de celui-ci. Grâce à cette fonctionnalité, les utilisateurs peuvent gérer leurs ressources de stockage de manière transparente, ce qui facilite l'accès et la manipulation des données stockées dans le nuage.

> Nous supposons que les données sont disponibles localement et peuvent être téléchargées sur Azure. Si les données sont déjà sur Azure, veuillez nous contacter pour trouver une solution afin de limiter les coûts d'entrée et de sortie.

Explorateur de stockage :

- télécharger des fichiers et des dossiers vers azure
- télécharger des fichiers

**Il existe un chemin spécial dans Databricks connu sous le nom de point de montage**. Le point de montage est un chemin virtuel qui permet aux utilisateurs d'accéder à leurs ressources de stockage comme si elles faisaient partie du système de fichiers Databricks.

**Le point de montage pour le compte de stockage dans Azure est `/mnt/fsdh-dbk-main-mount`**. Ce point de montage fournit un accès au compte de stockage, permettant aux utilisateurs de lire, écrire et modifier les fichiers stockés dans le compte de stockage Azure en utilisant les commandes standard du système de fichiers dans Databricks.

Grâce à cette configuration automatique, vous pouvez accéder de manière transparente à vos données entre le compte de stockage dans Azure et Databricks. En outre, le point de montage permet aux utilisateurs d'effectuer diverses tâches de traitement des données, telles que la manipulation, le nettoyage et l'analyse des données stockées dans le nuage, sans avoir à copier les données sur la machine locale ou le cluster.

## Documentation intégrée

L'un des points forts du DataHub scientifique fédéral est la **documentation intégrée**, qui facilite la compréhension et la navigation dans les capacités de la plateforme :

- Téléchargement et chargement de fichiers volumineux sur un support de stockage en utilisant `azcopy`**. Cette fonctionnalité est particulièrement utile pour les utilisateurs qui ont besoin de transférer des fichiers volumineux entre différents emplacements de stockage ou systèmes. Cliquez sur le bouton "Generate Container Token" pour générer un jeton qui peut être utilisé pour accéder au compte de stockage en utilisant l'outil de ligne de commande `azcopy`.

- **Accès à Databricks et ressources python/R**. Cette documentation fournit une vue d'ensemble rapide sur la façon d'accéder au montage de stockage et quelques liens vers la documentation Databricks.

**Formation** : Des connaissances existantes en R et Python devraient être suffisantes pour travailler avec la plateforme. L'aide avec d'autres fonctionnalités de databricks sera fournie au cas par cas pendant les heures de bureau disponibles.

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
