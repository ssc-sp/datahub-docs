---
remarks: Automatically translated with DeepL
source: /UserGuide/Projects/Datahub-Data-Project.md
---

_(draft documentation, please review)_

# Projet de données DataHub

Les projets de données dans DataHub présentent un modèle simple pour simplifier l'accueil des nouveaux utilisateurs dans les outils spécifiques d'un projet de données.

## Demande d'accès à la ressource

Le flux de travail des projets de données permet aux utilisateurs de demander l'accès à :
- Espace de travail Databricks spécifique au projet (*)
- WebForm spécifique au projet
- Espace de travail PowerBI spécifique au projet (*)

La demande d'accès aux ressources est ouverte à tous les utilisateurs de RNCan.

Si un utilisateur a besoin d'accéder à l'un de ces services, cela peut entraîner les deux flux de travail suivants (uniquement pour les ressources *) :
- **Workflow 1:** Demande de création de ressource. Cette demande sera examinée par l'équipe DataHub et si elle est approuvée, une ressource sera ajoutée au système Terraform et déployée lors de la prochaine mise à jour du système.
- **Workflow 2:** Demande d'accès à une ressource existante. Si les administrateurs du projet l'approuvent, l'automatisation du système DataHub ajoutera l'utilisateur à la ressource avec un accès limité. Des ACL supplémentaires pour l'accès à la ressource doivent être gérées dans la ressource elle-même.

## Maîtres d'ouvrage

Chaque projet de données a une liste de propriétaires de projet. Cette liste de propriétaires de projet est maintenue par les propriétaires de projet du tracker de projet DataHub qui comprend les membres clés de DataHub.

Les propriétaires du projet consistent en une liste de noms d'utilisateurs Azure et permettent à l'utilisateur d'approuver l'accès d'autres utilisateurs à une ressource (voir liste ci-dessus).
