---
remarks: Automatically translated with DeepL
source: /UserGuide/Workspace/data-visualization.md
draft: true
---

# Visualisation des données scientifiques avec DHSF

Le produit des données résultant de votre recherche scientifique peut être visualisé avec des outils familiers et supportés en se connectant à DHSF.

# Option 1. Application brillante

Cette option populaire peut être utilisée pour développer de puissantes applications web interactives entièrement en R. Une fois développées et testées, vous pouvez les déployer de deux manières :

  ## Exécuter sur Azure App Service

  DHSF peut facilement héberger votre application Shiny dans votre propre Azure App Service. L'exécution de votre application Shiny sur Azure App Service est plus rentable car elle ne nécessite pas un cluster Databricks de longue durée, qui coûte généralement beaucoup plus cher. Avec cette option, vous téléchargez votre code sur votre compte de stockage et un serveur Shiny conteneurisé démarre automatiquement avec votre code. DHSF vous donne également un domaine (par exemple https://my-shiny-app.fsdh-dhsf.science.cloud-nuage.canada.ca). La conception la plus simple consiste à faire en sorte que votre application Shiny se connecte aux fichiers de données sur votre compte de stockage Azure.

  Une fois déployée, votre application est automatiquement protégée par l'authentification sans aucun codage supplémentaire. Par conséquent, seuls les utilisateurs DHSF enregistrés peuvent visiter votre application Shiny. Vous pouvez sécuriser davantage votre application Shiny pour la limiter à une liste plus restreinte d'utilisateurs en écrivant du code dans votre app.R.

  ## Exécuter à l'intérieur de Databricks

  Bien que cela ne soit pas recommandé en raison du coût plus élevé, vous pouvez toujours héberger votre application Shiny dans votre ordinateur portable et faire fonctionner un cluster plus petit. C'est plus simple et plus rapide à mettre en place, mais Databricks impose une limite stricte de 50 Mo sur la taille des données utilisées dans votre application Shiny.

# Option 2. PowerBI

Vous pouvez développer des rapports PowerBI et des données sources à partir de votre espace de travail DHSF Databricks ou de votre DHSF Azure Storage.

  ## Source des données de stockage de la DHSF

  Vos rapports PowerBI peuvent récupérer les données de votre stockage DHSF en utilisant un jeton SAS généré à partir de l'application DHSF.

  ## Source des données : DHSF Databricks

  Vos rapports PowerBI peuvent également se connecter à vos clusters DHSF Databricks. Pour cette option, cependant, les clusters seront démarrés pour la récupération et l'actualisation des données.


