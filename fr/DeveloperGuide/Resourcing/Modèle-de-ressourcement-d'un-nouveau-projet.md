---
remarks: Automatically translated with DeepL
source: \$1
---

## Diagramme de séquence

Ce diagramme de séquence montre les étapes de la création d'un nouvel espace de travail.

``mermaid``
diagramme de séquences
    acteur User comme User
    actor Admin comme Datahub Admin
    Portail du participant en tant que portail Datahub

    File d'attente de participants comme files d'attente de messages

    participant RM comme Resourcing Manager

    participant Repos comme dépôts

    participant ADO comme Pipeline
    numéro automatique


    Utilisateur ->> Portail : demander un nouvel espace de travail
    activer le portail
    Portal ->> Portal : insert workspace record
    note sur le portail : [Statut] Demandé
    Portail ->> Utilisateur : rafraîchir l'interface utilisateur
    note sur l'utilisateur : l'utilisateur peut maintenant voir la page de l'espace de travail avec le statut de la provision
    Portail ->> File d'attente : ajouter un message d'exécution des ressources
    désactiver le portail
    note sur la file d'attente : /templates/new-project-template

    File d'attente ->> RM : message de déclenchement de l'exécution des ressources
    activer RM
    RM ->> Dépôts : git clone dépôts
    Repos ->> RM : latest ;

    RM ->> RM : git checkout -b < espace de travail-branche>
    la boucle des ressources fonctionne
      RM ->> RM : copie du modèle
      RM ->> RM : extraction et sauvegarde des variables
      RM ->> RM : git commit en tant qu'utilisateur
    fin

    RM ->> ADO : git create pull request avec les détails de l'utilisateur
    activer ADO
    ADO ->> RM : id de demande de pull
    désactiver l'OAD

    RM ->> File d'attente : mise à jour de l'état
    désactiver RM
    note sur la file d'attente : [Statut] En attente d'approbation

    File d'attente ->> Portail : déclencher la mise à jour du statut
    activer le portail
    Portal ->> Portal : mise à jour de l'enregistrement de l'espace de travail
    Portail ->> Admin : notify admin
    désactiver le portail

    activer l'Admin
    Admin ->> ADO : approuver la demande de pull
    désactiver l'Admin

    activer ADO
    ADO ->> ADO : fusionner une demande de retrait
    ADO ->> ADO : exécuter le pipeline
    ADO ->> File d'attente : mise à jour de l'état
    désactiver l'OAD
    note sur la file d'attente : [Statut] Terminé

    File d'attente ->> Portail : déclencher la mise à jour du statut
    activer le portail
    Portal ->> Portal : mise à jour de l'enregistrement de l'espace de travail
    désactiver le portail

```

# Exemples de messages

## Nouveau modèle de projet

Voici un exemple de message du portail Datahub placé dans la file d'attente `resource-run-request` pour déclencher la création d'un nouveau projet.

```json
{
  "modules" : [
    {
      "nom" : "templates/new-workspace-template",
      "version" : "la plus récente".
    }
  ],
  "espace de travail" : {
    "nom" : "<nom de l'espace de travail>",
    "acronyme" : "<acronyme de l'espace de travail>",
    "organisation" : {
      "nom" : "<nom de l'organisation>",
      "code" : "<Code de l'organisation>"
    },
    "utilisateurs" : []
  },
  "requestingUserEmail" : "<email-utilisateur>"
}
```

## Message de mise à jour de l'état de la demande de tirage

Voici un exemple de message de l'infrastructure mis en file d'attente pour mettre à jour le statut d'un espace de travail après la création d'une demande de retrait.

```json
{
  "project_cd" : {
    "sensible" : faux,
    "type" : "string",
    "valeur" : "<acronyme de l'espace de travail>"
  },
  "new_project_template" : {
    "sensible" : faux,
    "type" : "string",
    "valeur" : "En attente d'approbation"
  }
}
```

## Message de mise à jour de l'état des pipelines

Voici un exemple de message de l'infrastructure placé dans la file d'attente pour mettre à jour l'état d'un espace de travail après l'exécution d'un pipeline.

```json
{
  "project_cd" : {
    "sensible" : faux,
    "type" : "string",
    "valeur" : "<acronyme de l'espace de travail>"
  },
  "new_project_template" : {
    "sensible" : faux,
    "type" : "string",
    "valeur" : "Complet"
  }
}
```
