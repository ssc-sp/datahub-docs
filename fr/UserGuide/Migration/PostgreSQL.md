# Migration ou retrait d'un base de données PostgreSQL

Ce document fournit des instructions sur:

* la migration de vos bases de données PostgreSQL de l'environnement de validation de concept (POC) vers votre nouvel espace de travail DHSF dans l'environnement de production (PROD)
* le retrait de vos bases de données PostgreSQL de l'environnement POC si vous ne transférez pas vos recherches vers l'environnement PROD

Veuillez noter: pour éviter toute perte de données, vous devez terminer la migration ou le retrait avant le 31 mars 2025.

## A. Migration de POC à PROD

Pour migrer vos bases de données PostgreSQL, vous devez disposer d'un nouvel espace de travail dans l'environnement PROD. L'équipe de support du DataHub scientifique fédéral fournira de l'information lorsqu'il sera prêt et fournira de l'aide quand nécessaire.

Une fois que vous avez un espace de travail dans l'environnement PROD, l'équipe de support du DataHub scientifique fédéral peut vous aider à migrer vos bases de données PostgreSQL. Veuillez soumettre une demande de support pour commencer.

Alternativement, vous pouvez migrer vos bases de données PostgreSQL vous-même comme suit:

### Étape 1. Créer une sauvegarde de votre base de données

Que vous migriez vos bases de données PostgreSQL vers votre nouvel espace de travail dans l'environnement PROD ou que vous les retiriez de l'environnement POC, vous devez commencer par créer une sauvegarde de vos bases de données. Cette sauvegarde sera utilisée pour importer vos bases de données dans l'environnement PROD ou pour les stocker pour une utilisation future.

Vous pouvez choisir l'une des trois méthodes suivantes pour créer une sauvegarde.

#### Option 1: Créer une sauvegarde à l'aide de `pg_dump`

1. Connectez-vous à votre base de données PostgreSQL à l'aide de `psql` ou d'un outil similaire.

2. Exécutez la commande suivante pour créer une sauvegarde de votre base de données:

```bash
pg_dump -U <username> -d <database_name> -f <dump_file_name>.sql
```

Remplacez `<username>` par votre nom d'utilisateur PostgreSQL, `<database_name>` par le nom de la base de données que vous souhaitez sauvegarder et `<dump_file_name>` par le nom que vous souhaitez donner au fichier de sauvegarde.

3. Validez que le fichier de sauvegarde a été créé avec succès en vérifiant l'emplacement du fichier.

#### Option 2: Créer une sauvegarde à l'aide de pgAdmin

1. Ouvrez pgAdmin et connectez-vous à votre base de données PostgreSQL.

2. Cliquez avec le bouton droit sur la base de données que vous souhaitez sauvegarder et sélectionnez `Sauvegarde...`.

![Preview 1](/api/docs/UserGuide/Migration/postgres-pgadmin-1.png)

3. Dans l'onglet `Options de sauvegarde`, sélectionnez le format du fichier de sauvegarde (par exemple, `Plain`).

4. Dans le champ `Nom de fichier`, spécifiez l'emplacement et le nom du fichier de sauvegarde.

![Preview 2](/api/docs/UserGuide/Migration/postgres-pgadmin-2.png)

5. Cliquez sur `Sauvegarder` pour créer le fichier de sauvegarde.

6. Validez que le fichier de sauvegarde a été créé avec succès en vérifiant l'emplacement du fichier.

#### Option 3: Créer une sauvegarde à l'aide de DBeaver

1. Ouvrez DBeaver et connectez-vous à votre base de données PostgreSQL.

2. Cliquez avec le bouton droit sur la base de données que vous souhaitez sauvegarder et sélectionnez `Outils` > `Exporter la base de données`.

3. Dans la fenêtre qui s'ouvre, sélectionnez l'emplacement du fichier de sauvegarde.

4. Cliquez sur `Exporter` pour créer le fichier de sauvegarde.

5. Validez que le fichier de sauvegarde a été créé avec succès en vérifiant l'emplacement du fichier.

### Étape 2. Importer votre base de données dans PROD

Une fois que vous avez créé les fichiers de sauvegarde (Étape 1), vous pouvez importer vos bases de données dans l'environnement PROD en utilisant l'une des trois options ci-dessous.

#### Option 1: Importer la sauvegarde à l'aide de `psql`

1. Connectez-vous à la base de données PostgreSQL PROD à l'aide de `psql` ou d'un outil similaire.

2. Exécutez la commande suivante pour importer le fichier de sauvegarde dans la base de données PROD:

```bash
psql -U <username> -d <database_name> -f <dump_file_name>.
```

Remplacez `<username>` par votre nom d'utilisateur PostgreSQL, `<database_name>` par le nom de la base de données que vous souhaitez importer et `<dump_file_name>` par le nom du fichier de sauvegarde.

3. Validez que le fichier de sauvegarde a été importé avec succès en vérifiant l'emplacement du fichier.

#### Option 2: Importer la sauvegarde à l'aide de pgAdmin

1. Ouvrez pgAdmin et connectez-vous à votre base de données PostgreSQL PROD.

2. Cliquez avec le bouton droit sur la base de données dans laquelle vous souhaitez importer la sauvegarde et sélectionnez `Restaurer...`.

3. Dans la fenêtre qui s'ouvre, sélectionnez le fichier de sauvegarde que vous souhaitez importer.

4. Cliquez sur `Restaurer` pour importer le fichier de sauvegarde.

5. Validez que le fichier de sauvegarde a été importé avec succès en vérifiant l'emplacement du fichier.

#### Option 3: Importer la sauvegarde à l'aide de DBeaver

1. Ouvrez DBeaver et connectez-vous à votre base de données PostgreSQL PROD.

2. Cliquez avec le bouton droit sur la base de données dans laquelle vous souhaitez importer la sauvegarde et sélectionnez `Outils` > `Importer la base de données`.

3. Dans la fenêtre qui s'ouvre, sélectionnez le fichier de sauvegarde que vous souhaitez importer.

4. Cliquez sur `Importer` pour importer le fichier de sauvegarde.

5. Validez que le fichier de sauvegarde a été importé avec succès en vérifiant l'emplacement du fichier.

## B. Retrait de PostgreSQL de POC

Si vous ne souhaitez pas migrer vos bases de données PostgreSQL vers l'environnement PROD, vous pouvez les retirer de l'environnement POC en suivant les étapes ci-dessous.

## C. Support

Si vous rencontrez des problèmes lors du processus de migration, veuillez contacter l'équipe de support du DataHub scientifique fédéral en soumettant une demande de support. Notre équipe se fera un plaisir de vous aider à migrer ou à retirer vos bases de données PostgreSQL.
[]: # (END)