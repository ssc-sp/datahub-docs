---
remarks: Automatically translated with DeepL
source: /UserGuide/Database/psql-databricks-comparison.md
draft: true
---

# PostgreSQL vs Azure Databricks Fonctionnalités des bases de données

Le DataHub scientifique fédéral offre plusieurs façons d'utiliser la fonctionnalité de base de données. Ce guide compare l'utilisation d'une base de données PostgreSQL sur le DHSF avec les fonctionnalités de base de données fournies par Azure Databricks.

## Introduction

Lorsqu'il s'agit d'héberger une base de données avec DHSF, plusieurs options sont disponibles. L'un des choix les plus populaires est l'utilisation de PostgreSQL, tandis qu'une autre option consiste à tirer parti des fonctionnalités de base de données fournies par Azure Databricks. Dans cette comparaison, nous allons explorer les principales différences et les avantages de chaque approche.

## PostgreSQL

PostgreSQL est un service de base de données entièrement géré qui vous permet de déployer des bases de données PostgreSQL dans le nuage. Il offre une haute disponibilité, des sauvegardes automatiques et une intégration avec d'autres services. Voici quelques-unes des principales caractéristiques de PostgreSQL :

- Déploiement facile des bases de données PostgreSQL
- Haute disponibilité intégrée et sauvegardes automatiques
- Prise en charge des fonctionnalités avancées de PostgreSQL telles que JSONB, la recherche plein texte et les types de données spatiales
- Intégration transparente avec d'autres services tels que les applications web ou les API

## Fonctionnalités de la base de données Azure Databricks (Hive)

Azure Databricks est une plateforme analytique qui associe Apache Spark à un environnement collaboratif pour la science des données et l'apprentissage automatique. Bien qu'il soit principalement connu pour ses capacités de traitement des big data, Azure Databricks offre également de puissantes fonctionnalités de base de données. Parmi les principales fonctionnalités de base de données offertes par Azure Databricks, citons :

- Delta Lake : Une couche de stockage transactionnel qui fournit des transactions ACID, l'application du schéma et le versionnage des données pour les lacs de données.
- Moteur Delta : Un moteur de requête haute performance optimisé pour Delta Lake, permettant des requêtes SQL rapides et évolutives sur de grands ensembles de données.
- Delta Live Tables : Une fonction de capture des données de changement en temps réel (CDC) qui vous permet de capturer et de traiter les changements de données en temps réel à partir de diverses sources.
- Architecture de lac de données : Azure Databricks promeut une architecture unifiée qui combine le meilleur des lacs de données et des entrepôts de données, permettant un stockage, un traitement et une analyse efficaces des données.

Databricks s'appuie sur le projet standard [Apache Hive] (https://hive.apache.org/) qui permet d'exploiter le stockage standard et d'interroger les données à l'aide de SQL. Le modèle sous-jacent est très différent d'une base de données traditionnelle.
- Databricks SQL nécessite que le cluster soit activé pour exécuter des requêtes SQL.
- Les grands ensembles de données peuvent être facilement pris en charge en augmentant simplement la taille des grappes.
- Il n'y a que des coûts de stockage pour les données qui ne sont pas utilisées
- Les grands ensembles de données sont rentables car le stockage standard Azure est utilisé.

## Comparaison

Ce tableau présente les principales différences entre PostgreSQL et les fonctionnalités de la base de données Azure Databricks :

| Fonctionnalité | PostgreSQL | Fonctionnalités de la base de données Azure Databricks (Hive Tables) |
| ---------------- | ------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| Modèle de base de données | Base de données relationnelle traditionnelle | Plate-forme d'analyse de données unifiée basée sur l'architecture Lakehouse |
| Cas d'utilisation principal | Base de données généraliste. Intégration d'applications Web / API. Requêtes SQL complexes. | Analyse des big data et traitement en temps réel. Apprentissage automatique. Exploration collaborative des données. 
| Schéma SQL traditionnel strict | Gestion flexible et auto-schema | Schéma SQL traditionnel strict
| Performances - Bon pour les charges de travail OLTP.                                                  | Optimisé pour le traitement des données volumineuses (big data).                                                             |
| Mise à l'échelle limitée dans la configuration actuelle | Mise à l'échelle horizontale avec le moteur Delta.                                                          
| Intégration | Intégration transparente avec les applications web et les API.                              | Intégration avec les flux de travail de traitement des big data et d'apprentissage automatique.                           |

## Cas d'utilisation recommandés

### PostgreSQL

- Application Web
- Formulaire interactif
- Intégration de l'API
- Connexion à une application existante

### Databricks SQL Hive Tables

- Tableaux de bord Databricks
- Données d'expériences scientifiques
- Des données évolutives qui nécessitent des schémas flexibles
- Données intermédiaires du pipeline ETL

## Différence de coût

### Les banques de données à la demande

- Le coût de Databricks est _payé pour ce que vous utilisez_, c'est-à-dire qu'il dépend de la taille du cluster et de sa durée de fonctionnement.
- En cas d'utilisation légère, il est possible de maintenir les bases de données à moins de 100 dollars par mois, y compris les tables Hive.
- Il est recommandé d'effectuer quelques petites expériences et de contrôler les coûts afin d'estimer précisément le coût.

### Coût de PostgreSQL

- PostgreSQL dans DHSF utilise le modèle [Azure Flexible Server] (https://learn.microsoft.com/fr-ca/azure/postgresql/flexible-server/quickstart-create-server-portal) qui est également basé sur la consommation (modèle burstable).
- En cas d'utilisation très légère, le coût est d'environ 30 dollars par mois.
- Il est recommandé d'effectuer également des expériences et de contrôler le coût afin de déterminer plus précisément le coût d'une application spécifique.

## Connectivité

| Fonctionnalité | PostgreSQL | Fonctionnalités de la base de données Azure Databricks | Fonctionnalités de la base de données Azure Databricks
| ---------------------------- | ---------- | -------------------------------------- |
| Connexion à partir d'une application Web | X | Impossible |
| Connecter à partir de Power BI | X | X |
| Connecter à partir de Tableau | X | X |
| X | Possible mais nécessite que le cluster soit activé |

## Conclusion

En conclusion, PostgreSQL et Azure Databricks Database Features offrent des atouts et des cas d'utilisation différents. PostgreSQL est bien adapté aux charges de travail des bases de données générales, à l'intégration des applications web et aux requêtes SQL complexes. En revanche, les fonctionnalités de base de données d'Azure Databricks sont optimisées pour l'analyse des big data, le traitement en temps réel et l'exploration collaborative des données. En fonction de votre cas d'utilisation spécifique et de vos exigences, vous pouvez choisir la solution de base de données qui répond le mieux à vos besoins.
