---
remarks: Automatically translated with DeepL
source: \$1
---

Il y a deux files d'attente qui sont utilisées dans le processus de ressourcement.

1. La file d'attente [`resource-run-request`] est utilisée pour déclencher le processus de demande de ressourcement. Cette file d'attente est utilisée pour déclencher le processus de ressourcement lorsqu'un nouvel espace de travail ou un nouveau module de ressources est demandé. Le message qui est envoyé à cette file d'attente doit contenir l'identifiant de l'espace de travail et le nom du modèle qui doit être utilisé pour l'exécution.

1. La file d'attente [`terraform-output`] est utilisée pour mettre à jour le statut du processus de ressourcement. Cette file d'attente est utilisée pour mettre à jour le statut du processus de ressourcement lorsqu'un nouvel espace de travail ou un nouveau module de ressources est demandé. Le message qui est envoyé à cette file d'attente doit contenir l'identifiant de l'espace de travail et le statut du processus de ressourcement.

Les valeurs de statut possibles pour l'exécution des ressources d'un projet sont les suivantes :

- `Requested` quand un utilisateur demande un nouvel espace de travail dans le portail
- `Pending Approval` lorsque le responsable des ressources a créé une demande de tirage.
- `Complete` lorsque la demande de pull a été approuvée et que le pipeline a été exécuté.
- `Error` lorsqu'une erreur se produit

Voici, en un coup d'œil, un schéma du processus d'exécution des ressources :

``mermaid``
organigramme RL

   Portail [Portail Datahub]
   File d'attente [File d'attente de messages]
   RM [Resourcing Manager]
   ADO [Pipeline]


   Portail --> |Resource Request| Queue
   File d'attente --> |Resource Run| RM
   RM --> |Write Terraform| ADO
   ADO --> |Run Terraform| ADO
   ADO --> |Mise à jour du projet| File d'attente
   File d'attente --> |Mise à jour du projet| Portail

   sous-graphe Resourcing Manager
      RM
      ADO
   fin
```
