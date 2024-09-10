# Vue d'ensemble de la migration

À l'automne 2024, le Datahub scientifique fédéral commencera à conclure la phase de validation du concept (POC) et passera à la phase de production (PROD).

Pour vous préparer à cette transition, nous avons créé une série de guides de migration pour vous aider à migrer vos données, votre stockage, vos applications web et vos espaces de travail Databricks de l'environnement POC vers l'environnement PROD ou à les retirer de l'environnement POC.

Ce document fournit des informations générales sur le processus de migration. Vous trouverez des instructions détaillées sur la manière de migrer des ressources spécifiques dans la barre latérale.

## Processus et dates limites

Le processus de migration comprend les étapes suivantes:

* Automne 2024:
    * L'équipe du Datahub scientifique fédéral commencera à contacter les utilisateurs pour les informer quand l'environnement PROD sera prêt.
    * L'équipe du Datahub scientifique fédéral communiquera avec tous les responsables dans l'environnement POC pour discuter le processus et les exigences pour créer un nouvel espace de travail dans l'environnement PROD.
    * Les responsables qui veulent créer un nouvel espace de travail dans l'environnement PROD peuvent contacter l'équipe du Datahub scientifique fédéral pour commencer le processus et obtenir de l'aide pour la migration.
* Après l'ouverte de l'environnement PROD:
    * Les responsables qui créent un nouvel espace de travail dans l'environnement PROD peuvent commencer à migrer leurs ressources de l'environnement POC vers l'environnement PROD.
    * Lorsque les responsables ont créé un nouvel espace de travail dans l'environnement PROD, vous pouvez migrer vos ressources en utilisant les guides de migration fournis.
    * Si vous n'utilisez pas l'environnement PROD, vous pouvez retirer vos ressources de l'environnement POC en suivant les instructions de retrait fournies.
* __28 février 2025:__ Date limite pour l'experimentation et analyse dans l'environnement POC.
* __1 mars 2025:__ Tous les utilisateurs seront convertis aux utilisateurs invitée dans ses espaces de travail POC.
* __31 mars 2025:__ Date limite pour la migration ou le retrait de vos ressources de l'environnement POC. 
* __1 avril 2025:__ L'environnement POC sera mis hors service.

## Questions fréquemment posées

### Quelle est la différence entre la migration et le retrait?

- **Migration:** Déplacement de vos ressources de l'environnement POC vers l'environnement PROD.
- **Retrait:** Retirer vos ressources de l'environnement POC sans les migrer vers l'environnement PROD.

### Pourquoi dois-je migrer mes ressources?

La migration de vos ressources de l'environnement POC vers l'environnement PROD garantit que vos données et applications sont préservées et accessibles à long terme. Elle vous permet également de profiter des fonctionnalités et des capacités améliorées de l'environnement PROD.

### Qui peut migrer des ressources?

* __Retrait des ressources:__ Tous les utilisateurs de l'environnement POC, y inclus les invités.
* __Migration des ressources:__
    * Ajouter des données: Les collaborateurs, administrateurs, et responsables peuvent ajouter des données aux espaces de travail dans PROD.
    * Provisionner des ressources: Les responsables peuvent provisionner des ressources dans PROD.

### Quelles ressources peuvent être migrées?

Vous pouvez migrer toutes les ressources provisionnées dans l'environnement POC, y compris les bases de données, le stockage, les applications Web et les espaces de travail Databricks.

### Que se passe-t-il si je ne migre pas mes ressources?

Si vous ne migrez pas vos ressources avant la date limite, elles seront perdues lorsque l'environnement POC sera mis hors service. Veillez à migrer vos ressources avant la date limite afin d'éviter toute perte de données.

### Que se passe-t-il si je n'ai pas un nouvel espace de travail dans l'environnement PROD avant le 31 mars 2025?

Si vous voulez créer un nouvel espace de travail dans l'environnement PROD, on vous encourage fortement de commencer le processus de migration dès que possible pour éviter toute perte de données ou interromption. Si le provisionnement de l'espace de travail PROD est en cours mais n'est pas terminé avant la date limite, veuillez contacter l'équipe de support du Datahub scientifique fédéral pour obtenir de l'aide.

### Comment puis-je obtenir de l'aide pour la migration?

Si vous rencontrez des problèmes au cours du processus de migration, veuillez contacter l'équipe de support du Datahub scientifique fédéral en soumettant une demande de support. Notre équipe se fera un plaisir de vous aider à migrer ou à transférer vos ressources.