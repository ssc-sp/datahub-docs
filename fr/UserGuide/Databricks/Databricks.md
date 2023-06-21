---
remarks: Translation reviewed by DataHub team
source: /UserGuide/Databricks/Databricks.md
draft: false
---


## Azure Databricks for Cloud Analytics (en anglais)

Databricks est une plateforme similaire aux carnets Jupyter et permet aux scientifiques de créer et de partager des documents qui incluent du code en direct, des équations et d'autres ressources multimédias. Databricks s'intègre au stockage et à la sécurité de votre compte cloud, et gère et déploie l'infrastructure cloud en votre nom.

### Accès au stockage par le biais de Databricks

Le DataHub fournit un environnement unifié avec du stockage et des databricks et chaque espace de travail comprend un compte de stockage auquel on peut accéder via Databricks en utilisant des points de montage. 

### Politiques de cluster de Databricks

Le DataHub propose quelques politiques de cluster prédéfinies et un cluster polyvalent par défaut. Les utilisateurs chefs de projet peuvent créer des clusters supplémentaires en utilisant l'une des politiques. Les utilisateurs réguliers du projet peuvent démarrer et utiliser ces clusters.

|Nom de la politique | DBU max. par heure | Type de nœud | Nombre max. de travailleurs 
|------------|------------------|----------|----------- |
| DataHub Small |4 |<ul><li>Standard_D4ds_v5</li></ul>|2|
| DataHub Regular | 12 | <u/><li>Standard_D4ds_v5 (Default)</li><li>Standard_D8ds_v5</li><li>Standard_D16ds_v5</li></ul>| 4|
| DataHub Large|64|<ul><li>Standard_D4ds_v5</li><li>Standard_D8ds_v5 (par défaut)</li><li>Standard_D16ds_v5</li><li>Standard_D32ds_v5</li><li>Standard_D48ds_v5</li><li>Standard_D64ds_v5</li></ul>|32|

#### En savoir plus sur les Databricks

Vous trouverez dans les liens suivants une liste de ressources pour travailler avec Databricks, Python, R et Spark :

- [Apprendre les bases de Databricks et Spark](Databricks/Databricks-and-Spark-SQL-tutoriels)
- [Documentation officielle de Databricks] (https://docs.databricks.com/)
- [Guide de démarrage de Databricks]( https://docs.databricks.com/getting-started/index.html)
- Databricks Community Edition] (https://databricks.com/product/faq/community-edition) - Vous pouvez utiliser cette édition gratuitement à des fins d'apprentissage.
- [Intro à Databricks (Démo)](https://www.youtube.com/watch?v=n-yt_3HvkOI&t=27s)
- [Chaîne Youtube de Databricks] (https://www.youtube.com/channel/UC3q8O3Bh2Le8Rj1-Q-_UUbA)
- [Spark Sql](https://docs.databricks.com/spark/latest/spark-sql/index.html) - bien que vous ne manipuliez pas de grosses données, l'API spark peut s'avérer utile pour les tâches de traitement des données.
- [Guide Spark SQL] (https://spark.apache.org/docs/latest/sql-programming-guide.html)
- [Introduction à Spark] (https://www.kdnuggets.com/2018/10/apache-spark-introduction-beginners.html)




