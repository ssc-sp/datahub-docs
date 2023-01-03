[_metadata_: remarks]:- "Automatically translated with DeepL. From: /Data-Analytics-Projects---FAQ-(DRAFT).md"

[_(draft documentation, please review)_](/Data-Analytics-Projects---FAQ-(DRAFT).md)


**Quels sont les outils et services disponibles dans Datahub que je peux utiliser pour mon projet d'analyse de données ?
Portail Datahub - lieu unique pour gérer vos ensembles de données (inclure une description appropriée)
Databricks - utilisez ce service pour préparer, explorer et analyser vos données ainsi que pour créer des modèles d'intelligence artificielle, le tout en utilisant un moteur de calcul distribué à la demande (clusters).
Power BI - utilisez ce service pour explorer, analyser et créer des visualisations avancées de vos données.
Data Factory - utilisez ce service pour orchestrer et planifier les pipelines de données.
Azure Blob Storage - stockage rentable de données structurées, semi-structurées et non structurées dans le nuage.

**Qu'est-ce que Databricks?**
Databricks est une plateforme analytique basée sur le cloud qui vous permet de travailler avec des données à l'aide du framework Apache Spark. En d'autres termes, elle fournit une interface facile à utiliser pour que vos tâches liées aux données soient exécutées de manière transparente sur plusieurs machines virtuelles (clusters) en parallèle.
Il est également intégré à d'autres services en nuage tels que Azure Blob Storage et les bases de données, ce qui facilite le stockage et l'accès sécurisés à vos données dans Databricks.

**Quels sont les langages de programmation supportés par Databricks?**
Les langages suivants sont pris en charge : Spark SQL, Java, Scala, Python, R et SQL standard.
Il vous offre la possibilité de sélectionner la langue avec laquelle vos développeurs sont à l'aise pour votre projet. De plus, Databricks offre la possibilité aux développeurs d'utiliser plusieurs langues dans un seul carnet de notes.

**Mon équipe utilise actuellement Python/R pour l'analyse des données. Est-il facile de passer à l'utilisation de Python pour Spark (PySpark) et de R pour Spark (SparkR) ?
La syntaxe et les méthodologies utilisées par PySpark et SparkR sont axées sur l'idée de plusieurs ordinateurs exécutant le code que vous avez écrit, de sorte que leur syntaxe diffère dans une certaine mesure de celle de Python et de R. Par conséquent, il peut être nécessaire de suivre une formation pour acquérir les compétences nécessaires à l'utilisation de la version Spark des langages. D'une manière générale, la transition vers l'utilisation de PySpark et SparkR n'est pas très compliquée.

**Mon projet de données n'est pas complexe et ne nécessite pas l'utilisation de Spark ou d'une puissance de calcul parallèle, puis-je quand même utiliser les Databricks pour ce projet ?
Absolument, oui. Databricks permet d'écrire votre code en utilisant le langage Python ou R ordinaire et d'utiliser pandas et d'autres bibliothèques populaires. Il permet également d'exécuter votre code sur une seule machine virtuelle (un seul cluster), avec un minimum de ressources informatiques requises pour votre projet.

**Comment puis-je télécharger mon propre jeu de données et l'utiliser dans Databricks ?
Vous pouvez télécharger et gérer votre ensemble de données à l'aide du portail Datahub. Les données téléchargées seront stockées dans le nuage à l'aide d'Azure Blog Storage. Pour accéder au fichier téléchargé de manière programmatique à l'aide de Databricks, vous devrez obtenir le chemin d'accès où le fichier est stocké. Le chemin d'accès de votre fichier téléchargé peut être obtenu en allant sur le portail et en cliquant sur ...........
Voici un exemple de code qui montre comment accéder à des données stockées dans Blob Storage en utilisant python dans Databricks :


**Puis-je créer mon propre Cluster dans Databricks?**
Non. Pour l'instant, les clusters nécessaires à votre projet seront créés et configurés par l'équipe de Datahub en fonction de vos besoins. Vous disposerez des commandes pour démarrer et arrêter les clusters.

**L'environnement Databricks est-il certifié pour traiter des informations Protégé B ?
Non, actuellement, l'environnement Databricks pris en charge par NRCAN Datahub ne prend en charge que le niveau A protégé.

**Puis-je accéder à l'environnement Databricks à l'aide d'un carnet Jupyter fonctionnant localement ou d'IDE tels que PyCharm, VS Code et Spyder ?
Oui, vous pouvez le faire. Cependant, cela nécessite une certaine configuration sur les Databricks. Veuillez nous contacter avec vos besoins et nous serons heureux de vous aider.

**Comment mes données et le code source sont-ils protégés contre les accès non autorisés ?
Les environnements Datahub Analytics suivent le principe de sécurité du "moindre privilège", ce qui signifie que seul l'ensemble minimal de privilèges requis pour effectuer les tâches sera accordé aux utilisateurs.
Des contrôles d'accès et des procédures seront mis en place pour garantir que tout code source créé dans le cadre de votre projet Databricks ne peut être consulté et exécuté que par les utilisateurs qui y ont été autorisés.
De même, toutes les données stockées dans le compte Azure Blog Storage pour votre projet seront gérées en utilisant le contrôle d'accès au niveau du dossier pour garantir que la lecture et l'écriture des fichiers et des dossiers ne peuvent être effectuées que par les utilisateurs qui ont été explicitement autorisés à le faire.

**Qui sera responsable de la configuration des ressources Databricks (dossiers, clusters, groupes d'accès et utilisateurs), du compte de stockage Blob et des contrôles d'accès relatifs à ces composants ?
La configuration des ressources Databricks et du compte de stockage sera gérée par l'équipe de Datahub.

**Outre la configuration des ressources, quels autres services puis-je attendre de l'équipe de Datahub pour soutenir mon projet ?
Nous fournissons des conseils techniques et architecturaux pour toutes les données qui doivent être stockées et partagées au niveau du département.

**Nous avons terminé l'analyse et l'exploration des données dans Databricks, et maintenant nous aimerions avoir un pipeline de données construit pour mettre à jour régulièrement et stocker ces données dans un stockage persistant afin qu'elles puissent être partagées dans tout le département, quelle est la prochaine étape ?
Si vous disposez des ressources nécessaires et que vous souhaitez mettre en œuvre une solution prête pour la production afin de mettre à jour les données régulièrement, l'équipe de Datahub sera heureuse de vous aider à configurer l'environnement et de vous fournir des conseils et des avis techniques.
Si vous ne disposez pas des ressources nécessaires pour mettre en œuvre une telle solution, nous serons heureux de travailler avec vous pour recueillir les besoins et mettre en œuvre la solution en votre nom.
Pour le stockage et le partage de données qui nécessitent un accès fréquent pour une utilisation en production, nous recommandons l'utilisation de l'architecture Delta Lake.

**J'ai un projet d'intelligence artificielle/apprentissage machine que j'aimerais mettre en œuvre à l'aide de Databricks, comment puis-je commencer ?
Pour le moment, nous n'assumerons pas la responsabilité de la construction des modèles ML, mais nous serons heureux de vous aider en vous fournissant les outils et services techniques nécessaires pour atteindre l'objectif de votre projet.
Lien vers le formulaire d'inscription au projet ici....

**Quels sont les types de coûts que mon projet d'analyse peut engendrer ?
À un niveau élevé, les coûts de votre projet dépendront des 3 facteurs suivants :
1. Compute - Le type de machines virtuelles (Clusters Databricks) dont vous avez besoin pour le projet.

2. stockage - La quantité de données stockées en utilisant le service Blob Storage

3. le coût de tout service supplémentaire dont vous pourriez avoir besoin pour votre projet, tel que le coût des licences pour Power BI, Tableau, SQL Sever Database, etc.


**Où puis-je voir le modèle de calcul des coûts pour les services ?
Comment puis-je suivre les coûts encourus pour mon projet ?
Des rapports et des alertes seront configurés pour vous permettre de suivre facilement l'utilisation continue et le coût des services pour votre projet.

Est-ce que tout ou partie des coûts liés à mon projet seront couverts par Datahub ?
Dans certains cas, Datahub peut couvrir une partie du coût de votre projet. Veuillez nous contacter pour plus de détails.








