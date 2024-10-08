 # Instructions pour la migration des applications web

Ce document fournit des instructions sur:
* la migration des applications web de l'environnement de validation de concept (POC) vers votre nouvel espace de travail DHSF dans l'environnement de production (PROD)
* le retrait des applications web de l'environnement POC si vous ne transférez pas vos recherches vers l'environnement PROD

## A. Migrer les applications web de l'environnement POC vers l'environnement PROD

Pour migrer vos applications web, il faut avoir un espace de travail dans l'environnement PROD. L'équipe de support du DataHub scientifique fédéral fournira de l'information lorsqu'il sera prêt et fournira de l'aide quand nécessaire.

Pour migrer vos applications web de l'environnement POC vers l'environnement PROD, vous pouvez simplement redéployer votre application web dans PROD en utilisant votre fichier `docker-compose.yml` existant stocké dans votre repo Git. Veuillez arrêter votre application web dans l'environnement POC une fois que vous l'avez déployée avec succès dans l'environnement PROD.

**NOTE:** Il faut mettre à jour vos images ou le fichier `docker-compose.yml`, particulièrement si vous utilisez des configurations spécifiques à l'environnement POC, telles que les chaînes de connexion PostgreSQL ou les chaînes de connexion Databricks.

## B. Retirer les applications web du POC

Pour retirer vos applications web de l'environnement POC, vous pouvez simplement arrêter votre application web en utilisant le portail DHSF. L'application peut ensuite être redéployée sur une plateforme ou un environnement différent en utilisant vos images.

## C. Support

Si vous rencontrez des problèmes au cours du processus de migration, veuillez contacter l'équipe de support du DataHub scientifique fédéral en soumettant une demande de support. Notre équipe se fera un plaisir de vous aider à migrer votre application web ou à l'exporter.