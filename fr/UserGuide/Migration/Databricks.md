# Migration ou retrait du Databricks

Ce document fournit des instructions sur:

* la migration de vos espaces de travail Databricks de l'environnement de validation de concept (POC) vers votre nouvel espace de travail DHSF dans l'environnement de production (PROD)
* le retrait de vos espaces de travail Databricks de l'environnement POC si vous ne transférez pas vos recherches vers l'environnement PROD

Veuillez noter: pour éviter toute perte de données, vous devez terminer la migration ou le retrait avant le 31 mars 2025.

## A. Migration de POC à PROD

Pour migrer vos espaces de travail Databricks, vous devez disposer d'un nouvel espace de travail dans l'environnement PROD. L'équipe de support du DataHub scientifique fédéral fournira de l'information lorsqu'il sera prêt et fournira de l'aide quand nécessaire.

L'équipe de support du DataHub scientifique fédéral vous aidera à migrer vos espaces de travail Databricks. Veuillez soumettre une demande de support pour commencer.

Veuillez noter que uniquement les outils suivants peuvent être migrés de POC à PROD:

* Carnet de notes
* Repos Git
* Jobs
* Secrets
* Tables ACL
* Modèles d'apprentissage automatique

Si vous avez des outils non-mentionnés ci-dessus, il faut les recréer dans l'environnement PROD. Pour obtenir de l'aide pour recréer ces outils, veuillez contacter l'équipe de support du DataHub scientifique fédéral.

## B. Retrait de Databricks du POC

Si vous ne passez pas à l'environnement PROD, vous pouvez exporter vos carnets de notes, repos Git, jobs, secrets, tables ACL et modèles d'apprentissage automatique pour une utilisation future ou à des fins d'archivage.