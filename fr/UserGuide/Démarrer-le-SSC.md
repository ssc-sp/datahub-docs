---
remarks: Automatically translated with DeepL
source: /UserGuide/Getting-Started-SSC.md
---

_(draft documentation, please review)_

---
onProfileInclude : ssc
---
# Bienvenue sur DataHub

## Profil de métadonnées

Pour activer un espace de travail et demander des ressources, le propriétaire doit remplir un profil de métadonnées minimal. Le profil consiste en quelques questions destinées à fournir un contexte plus large sur le projet au programme scientifique et à aider les autres utilisateurs. Voir [Workspace Metadata Profile] (Metadata/Workspace_Profile.md) pour plus de détails.

## Collaborer avec DataHub et Cloud Storage

Pour collaborer sur des ensembles de données, les espaces de travail DataHub permettent la création de comptes de stockage en nuage. Les comptes de stockage Azure peuvent être provisionnés pour tous les utilisateurs et constituent un moyen de collaborer et d'échanger des ensembles de données volumineux entre utilisateurs de différents services.

### Création d'un compte de stockage

Une fois que les métadonnées d'un espace de travail sont demandées, il est possible de demander un compte de stockage. Les étapes à suivre sont détaillées dans le document [Création d'un compte de stockage] (Storage/Creating-Storage.md).

### Téléchargement de fichiers sur mon compte de stockage

Le téléchargement de fichiers vers votre compte de stockage est similaire à celui d'autres plateformes comme OneDrive ou SharePoint. L'interface principale est accessible à l'aide de l'[explorateur de stockage](Storage/Storage-Explorer.md).

### Téléchargement de grands ensembles de données

Pour télécharger de grands ensembles de données, il est recommandé d'utiliser un outil appelé [azcopy] (Storage/Use-AzCopy-to-Interact-with-Azure-Storage-Account.md) qui sera exécuté en ligne de commande. Le téléchargement par navigateur web n'est pas recommandé pour les téléchargements volumineux (cela dépend de la connexion Internet, mais généralement tout ce qui dépasse 1 Go) car le téléchargement web peut être interrompu par des déconnexions ou d'autres problèmes de bande passante.

### Partage des fichiers téléchargés

Le moyen le plus simple de partager des fichiers téléchargés est d'inviter des collaborateurs à votre espace de travail. Voir [Inviter des collaborateurs](Projects/Invite-Users.md)

## Cloud analytics avec Python, R et Databricks

Tous les participants au cas d'utilisation 2 (analyse) peuvent demander une instance databricks dans leur espace de travail.

Databricks est une plateforme similaire aux carnets Jupyter et permet aux scientifiques de créer et de partager des documents comprenant du code en direct, des équations et d'autres ressources multimédia. Databricks s'intègre au stockage et à la sécurité du cloud dans votre compte cloud, et gère et déploie l'infrastructure cloud en votre nom.

#### En savoir plus sur les Databricks

Vous trouverez dans les liens suivants une liste de ressources pour travailler avec Databricks, Python, R et Spark :

- [Apprendre les bases de Databricks et Spark](Databricks/Databricks-and-Spark-SQL-tutoriels)
- [Foire aux questions de Databricks](Databricks/Databricks-FAQ.md)
- [Documentation officielle de Databricks] (https://docs.databricks.com/)
- [Guide de démarrage de Databricks]( https://docs.databricks.com/getting-started/index.html)
- Databricks Community Edition] (https://databricks.com/product/faq/community-edition) - Vous pouvez utiliser cette édition gratuitement à des fins d'apprentissage.
- [Intro à Databricks (Démo)](https://www.youtube.com/watch?v=n-yt_3HvkOI&t=27s)
- [Chaîne Youtube de Databricks] (https://www.youtube.com/channel/UC3q8O3Bh2Le8Rj1-Q-_UUbA)
- [Spark Sql](https://docs.databricks.com/spark/latest/spark-sql/index.html) - bien que vous ne manipuliez pas de grosses données, l'API spark peut s'avérer utile pour les tâches de traitement des données.
- [Guide Spark SQL] (https://spark.apache.org/docs/latest/sql-programming-guide.html)
- [Introduction à Spark] (https://www.kdnuggets.com/2018/10/apache-spark-introduction-beginners.html)

### Accès au stockage par le biais de Databricks

Le DataHub fournit un environnement unifié avec du stockage et des databricks et chaque espace de travail comprend un compte de stockage auquel on peut accéder via Databricks en utilisant des points de montage.


