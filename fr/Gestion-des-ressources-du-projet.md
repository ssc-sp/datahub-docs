[_metadata_: remarks]:- "Automatically translated with DeepL. From: /Management-of-Project-Resources.md"

[_(draft documentation, please review)_](/Management-of-Project-Resources.md)

# Terraform File Storage

- Contient des fichiers TF avec les détails de la configuration pour chaque projet
- Exemple
  ```
    PROJET1/
       stockage.tf
       databricks.tf
           o databricks-worspace.tf
           o databricks-users.tf
       sqlserver.tf
           o sqlserver-instance.tf
           o sqlserver-users.tf
  ```

# Générateur Terraform

## Entrée

- Paramètres de la ressource DataHub
  `<sample JSON from DataHub>`

## Sortie

- Paramètres du module Terraform
- Fichiers TF

## Déclencheur

- Ajouter/supprimer des utilisateurs dans DataHub

## Exemples

`<TF Databricks Provider>`

# Terraform Runner

## Objectifs

- Exécute l'exécution des ressources TF pour tous les projets
- A besoin d'un accès en lecture au compte de stockage TF
- Nécessite des autorisations au niveau du groupe de ressources (propriétaire ?) pour créer des ressources
- Par exemple, le fournisseur Databricks synchronisera la liste des utilisateurs du projet Data avec le fournisseur TF Databricks.
- Par exemple, synchroniser les ACL sur le compte de stockage Gen 2.

- Entrée :
  - Fiches TF
  - Paramètres TF
  - Liste des utilisateurs du projet
- Sortie :
  - ? ??

## Déclencheur

## Validation

- Nécessite une validation manuelle des changements
- Sécurité intégrée pour éviter les problèmes

# Exemple complet : Créer des Databricks + synchroniser les utilisateurs

1. L'utilisateur demande des Databricks dans le portail DataHub du projet PRJ1.
1. Créer une instance de Databricks dans Azure `databricks-worspace.tf` - entrée : nom de l'espace de travail, étiquettes, niveau - sortie : nom de l'instance
1. Le générateur Terraform génère
   - `{ 'resource-type' : 'databricks-workspace', 'workspace' : 'Project 1', 'tags' : 'datahub-prj1', 'databricks-tier' : 'premium', 'users' : [{ email : me@me.com, role : user},{ email : me1@me.com, role : admin }] }`
   - Sorties du générateur
   ```
     PRJ1/
        databricks-worspace.tf
   ```
1. Le runner Terraform exécute `databricks-worspace.tf` - La sortie JSON est stockée dans la table de ressources DataHub.

   - Terraform génère un fichier de sortie 'output.json'.

   ```
     PRJ1/
        databricks-worspace.tf
        output.json
   ```

   - Le runner Terraform charge output.json
   - Le contenu de `output.json` est stocké dans la table des ressources du projet.

1. Le générateur Terraform génère

   - `{ 'resource-type' : 'databricks-workspace', 'workspace' : 'Project 1', 'tags' : 'datahub-prj1', 'tier' : 'premium', 'users' : [{ email : me@me.com, role : user},{ email : me1@me.com, role : admin }] }`
   - Sorties du générateur

   ```
     PRJ1/
        databricks-worspace.tf
        databricks-users.tf
        output.json
   ```

1. Synchroniser les utilisateurs du projet avec l'instance databricks `databricks-users.tf` - entrée : liste des utilisateurs (emails + rôles)
   - `{ 'resource-type' : 'databricks-users', 'workspace' : 'Project 1', 'tags' : 'datahub-prj1', 'tier' : 'premium', 'users' : [{ email : me@me.com, role : user},{ email : me1@me.com, role : admin }], 'databricks-url' : 'databricks12345.azuredatabricks.net' }``

## Diagrammes

### Nouveau projet

``mermaid``
diagramme de séquences
    acteur U comme utilisateur
    acteur A comme administrateur de DataHub
    participant P comme portail DataHub
    participant M comme microservice de ressourcement

      U ->> P : Créer un projet
      P ->> P : Projet vide de provision
      A ->> P : Approuver le projet limité
      P ->> M : Demander un nouveau projet
      M ->> M : Exécuter TF Nouveau Modèle de Projet
      M ->> P : Mise à jour du statut du projet
      M ->> M : Exécuter le module de stockage TF
      M ->> P : Mise à jour du statut du projet
      M ->> M : Exécuter le module TF Databricks
      M ->> P : Mise à jour du statut du projet
      M ->> M : Exécuter le module utilisateurs TF Databricks
      M ->> P : Mise à jour du statut du projet
      U ->> P : questions complètes sur le DMP
      P ->> P : Débloquer des crédits supplémentaires

```

### Ajouter des utilisateurs

``mermaid``
 diagramme de séquences
    acteur U comme utilisateur
    participant P comme portail DataHub
    participant M comme microservice de ressourcement

      U ->> P : Rejoindre le projet
      P ->> P : Mise à jour des utilisateurs du projet
      P ->> M : Envoi de la liste des utilisateurs au microservice de ressourcement
      M ->> M : Exécuter le module utilisateurs TF Databricks
      M ->> P : Mise à jour du statut du projet
```
