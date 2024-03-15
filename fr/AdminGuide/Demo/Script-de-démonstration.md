---
remarks: Automatically translated with DeepL
source: /AdminGuide/Demo/Demo-Script.md
draft: true
---

# Script de démonstration

[Je ne sais pas trop pourquoi nous avons cette image](image.png)

## Diapositive sur l'expérience utilisateur

Avant de passer à la démonstration, je tiens à souligner que l'agilité pour les utilisateurs finaux est notre principal moteur, tant du point de vue technique que du point de vue commercial.  En quelques minutes, vous pouvez accéder à des ressources basées sur le nuage et collaborer avec vos collègues au sein du GC.

Commençons donc par le processus d'intégration.

## Afficher la page d'enregistrement https://federal-science-datahub.canada.ca/register

Nous avons un processus d'intégration facile :
- Cliquez sur le lien d'inscription et saisissez leur adresse électronique.  
- ils recevront un courriel pour confirmer leur adresse électronique
- ils peuvent immédiatement accéder au portail.

## Afficher la page d'accueil

Page d'accueil de la DHSF](image-1.png)

Une fois connecté, vous arrivez sur la page d'accueil, où vous pouvez accéder à votre espace de travail. Un espace de travail est une zone privée où vous pouvez accéder à des services (analyse, calcul), stocker des données et inviter des collaborateurs.

## Afficher la page Explorer - autres travaux d'intérêt

![Page d'exploration](image-2.png)

Toutes les ressources sont disponibles dans les espaces de travail. Cette vue vous permet de parcourir tous les espaces de travail et les chercheurs peuvent voir si d'autres travaux intéressants sont en cours.

## Qu'est-ce qu'un espace de travail ? Aller dans l'espace de travail de démonstration DW1

Ce que nous appelons un espace de travail est un espace privé où vous pouvez
- les services d'accès (analyse, calcul, stockage),
- ouvrir "Voir les membres" pour inviter les collaborateurs à contribuer à l'analyse ou simplement à lire vos données en tant qu'invités.

## Stockage

- Ouvrir __Explorateur de stockage__ Stocker des données : interface commune où les collaborateurs peuvent travailler indépendamment pour charger, télécharger, partager et accéder aux données entre les départements

La boîte à outils du datahub prend en charge l'analyse, le calcul et le traitement des données (le stockage à long terme n'est pas encore prévu).

Le principal outil que nous fournissons pour l'analyse et l'informatique est DataBricks.
- [Open Example notebook](https://adb-1078013913864941.1.azuredatabricks.net/?o=1078013913864941#notebook/3052776818088804/command/3052776818088818)

Databricks est un outil standard de l'industrie où les utilisateurs peuvent
- travailler sur des données structurées et non structurées pour effectuer des analyses avancées,
- codévelopper des scripts en python,
- Mener des travaux d'ingénierie des données,
- et l'apprentissage automatique

## Afficher l'écran de configuration du cluster

![Créer un écran cluster](image-3.png)

Pour donner plus de flexibilité aux utilisateurs, dans Databricks, vous pouvez choisir la taille et la configuration de la grappe, et fixer des garde-fous sur la durée de fonctionnement et les coûts encourus.

La loi sur les droits de l'homme et les libertés fondamentales (loi sur les droits de l'homme) - Montrer la page de coût
Pour éviter les dépenses imprévues, DHSF fournit des rapports en temps quasi réel sur les coûts encourus, ainsi que des limites budgétaires et des avertissements sur l'utilisation.

## Apprendre la section

Comment utiliser efficacement les ressources ? Comment utiliser toutes les capacités des bases de données ou de SQL ? Créer un tableau de bord ? Afficher la page des ressources
- Section "Showcase ML
- Des outils de ML sont disponibles pour l'exploration ou pour les utilisateurs plus avancés.
- Couvre le ML Flow - fait des expériences, fournit la traçabilité

## Exemples

Pour illustrer comment le DataHub peut être utilisé dans des applications scientifiques, nous allons rapidement montrer deux exemples de projets hébergés dans le DataHub :
1. Le premier projet est le tableau de bord des pathogènes de l'hôte : AAC a demandé au DataHub une solution pour partager une base de données sur les agents pathogènes. Cette base de données contient des données provinciales sur tous les agents pathogènes et sa mise à jour et son partage sont essentiels pour leurs recherches. Ils utilisent actuellement une base de données MS Access, qu'ils échangent par courrier électronique, sans moyen direct de la partager ou de la moderniser.  Nous avons pu convertir et migrer les données dans Datahub.  En utilisant des outils modernes en python dans Databricks, nous avons développé des formulaires qui permettent aux utilisateurs de faire des recherches dans la base de données existante. La preuve de concept a été développée en deux semaines d'efforts et coûte environ 100$/mois.
1. Montrer l'application web : Collaboration entre le CNRC et l'Office des transports du Canada. Pour illustrer les solutions à un problème d'analyse de texte, l'équipe a développé sa propre application web pour fournir des résultats interactifs. L'application a été développée en R Shiny (outil largement utilisé dans la communauté de la science des données).  Ils n'ont pas pu collaborer avec elle.  Nous pouvons l'héberger dans DHSF et ils peuvent maintenant collaborer, télécharger des ensembles de données et mettre à jour des tableaux de bord alors qu'ils ne le pouvaient pas auparavant.  Le tout dans un environnement sécurisé.

## Nouvelles fonctionnalités

- Bases de données

## Arrêter le partage d'écran

En résumé, Datahub offre 3 fonctions clés
- l'accès à des outils modernes basés sur l'informatique en nuage,
- l'accès au stockage de manière agile.  
- capacité à collaborer largement au sein du CG


