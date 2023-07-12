---
remarks: Automatically translated with DeepL
source: /AdminGuide/Databricks-Guest.md
draft: true
---

# Vue d'ensemble des autorisations pour les invités Databricks

## Groupe d'utilisateurs

- Le groupe d'utilisateurs est un groupe spécial. Il hérite des autorisations du groupe de ressources Azure.
- Les utilisateurs disposent par défaut d'autorisations de lecture/écriture/cluster.

## Permissions requises

- Les invités ne doivent pas pouvoir modifier les classeurs
- L'invité pourrait avoir besoin de pouvoir démarrer les entrepôts SQL.
- L'invité ne doit pas pouvoir démarrer le cluster
- L'invité doit pouvoir consulter les espaces de travail

## SQL Warehouses

- Devrait offrir une meilleure alternative aux clusters pour l'interrogation des données SQL
- Temps de démarrage plus rapide

## Groupe d'invités

Le nouveau groupe d'invités est probablement le meilleur modèle pour permettre l'accès aux utilisateurs externes.

- Créer un groupe d'invités
    - Les invités ne doivent être ajoutés qu'au groupe d'invités et ne doivent pas être hérités du groupe de ressources Azure.
- Restreindre le groupe d'invités avec les droits suivants
    - [x] Accès à l'espace de travail
    - [x] Accès à Databricks SQL
    - Désactiver la "création de grappes"
- Ajuster les autorisations dans l'espace de travail
    - Ajouter un groupe d'invités avec l'autorisation _Can View_ (voir)
