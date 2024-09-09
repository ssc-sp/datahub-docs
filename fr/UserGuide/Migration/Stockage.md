# Migration ou retrait du stockage

Ce document fournit des instructions sur:

* la migration de vos ressources de stockage de l'environnement de validation de concept (POC) vers votre nouvel espace de travail DHSF dans l'environnement de production (PROD)
* le retrait de vos ressources de stockage de l'environnement POC si vous ne transférez pas vos recherches vers l'environnement PROD

Veuillez noter: pour éviter toute perte de données, vous devez terminer la migration ou le retrait avant le 31 mars 2025.

## A. Migration de POC à PROD

Pour migrer vos ressources de stockage, vous devez disposer d'un nouvel espace de travail dans l'environnement PROD. Pour obtenir des conseils sur la configuration de votre espace de travail, veuillez vous référer à [URL] ou contacter l'équipe de support du DataHub scientifique fédéral.

Une fois que vous avez un espace de travail dans l'environnement PROD, l'équipe de support du DataHub scientifique fédéral peut vous aider à migrer vos ressources de stockage. Veuillez soumettre une demande de support pour commencer.

Alternativement, vous pouvez migrer vos ressources de stockage vous-même comme suit:

### Option 1. Utiliser AzCopy pour migrer vos données directement

Pour migrer vos données de stockage, vous pouvez utiliser AzCopy pour copier les données de votre compte de stockage POC vers votre compte de stockage PROD.

> **Note:** Il faut avoir le stockage PROD configuré et prêt à recevoir les données avant de commencer la migration.

Il faut installer AzCopy sur votre machine locale ou sur une machine virtuelle. Il faut également se connecter avec le même compte que celui utilisé pour le DataHub scientifique fédéral.

1. Obtenir l'URL SAS pour POC en naviguant vers Stockage, en cliquant sur l'onglet AzCopy, puis en cliquant sur "Générer un jeton de conteneur". L'URL est affichée dans diverses commandes `azcopy` sur cette page, copiez-la et enregistrez-la pour une utilisation future.

2. Obtenir l'URL SAS pour PROD en naviguant vers Stockage, en cliquant sur l'onglet AzCopy, puis en cliquant sur "Générer un jeton de conteneur". L'URL est affichée dans diverses commandes `azcopy` sur cette page, copiez-la et enregistrez-la pour une utilisation future.

3. Exécuter la commande AzCopy suivante pour copier les données du compte de stockage POC vers le compte de stockage PROD. Remplacez `<POC_SAS_URL>` et `<PROD_SAS_URL>` par les URL SAS obtenues dans les étapes précédentes:

```bash
azcopy copy "<POC_SAS_URL>" "<PROD_SAS_URL>" --recursive
```

4. Valider que les données ont été copiées avec succès en vérifiant le compte de stockage PROD.

### Option 2. Utiliser AzCopy pour télécharger les données localement

Pour télécharger vos données du compte de stockage POC sur votre machine locale, vous pouvez utiliser AzCopy pour copier les données du compte de stockage POC sur votre machine locale.

Il faut installer AzCopy sur votre machine locale ou sur une machine virtuelle. Il faut également se connecter avec le même compte que celui utilisé pour le DataHub scientifique fédéral.

1. Obtenir l'URL SAS pour POC en naviguant vers Stockage, en cliquant sur l'onglet AzCopy, puis en cliquant sur "Générer un jeton de conteneur". L'URL est affichée dans diverses commandes `azcopy` sur cette page, copiez-la et enregistrez-la pour une utilisation future.

2. Exécuter la commande AzCopy suivante pour copier les données du compte de stockage POC sur votre machine locale. Remplacez `<POC_SAS_URL>` par l'URL SAS obtenue dans l'étape précédente et `<CHEMIN_LOCAL>` par le chemin du répertoire local où vous souhaitez enregistrer les données:

```bash
azcopy copy "<POC_SAS_URL>" "<CHEMIN_LOCAL>" --recursive
```

3. Valider que les données ont été copiées avec succès en vérifiant le chemin local.

### Option 3. Exporter manuellement les données

Si vous ne pouvez pas utiliser AzCopy pour migrer vos données, vous pouvez exporter manuellement vos données du compte de stockage POC et les importer dans le compte de stockage PROD en téléchargeant simplement les données du compte de stockage POC.

## B. Retrait du stockage

Si vous ne passez pas à l'environnement PROD, vous pouvez utiliser l'Option 2 ou 3 ci-dessus pour télécharger votre stockage pour une utilisation future ou à des fins d'archivage.

## C. Support

Si vous rencontrez des problèmes au cours du processus de migration, veuillez contacter l'équipe de support du DataHub scientifique fédéral en soumettant une demande de support. Notre équipe se fera un plaisir de vous aider à migrer ou à retirer vos ressources.