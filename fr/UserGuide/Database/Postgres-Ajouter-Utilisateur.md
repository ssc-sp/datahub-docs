# Ajouter un utilisateur du DHSF à PostgreSQL

En tant que responsable d'un espace de travail, vous devez créer un compte utilisateur pour chaque utilisateur qui a besoin d'accéder à la base de données PostgreSQL sur le DataHub scientifique fédéral (DHSF). Ce guide vous guidera à travers les étapes pour ajouter un utilisateur à la base de données PostgreSQL sur le DHSF.

## Option A. Utilisation d'une requête SQL

1. Connectez-vous à la base de données PostgreSQL en utilisant un outil comme `psql`, Python, ou tout autre client SQL.

2. Exécutez la requête SQL suivante pour créer un nouvel utilisateur:

```sql
CREATE USER <username> WITH PASSWORD '<password>';
```

Remplacez `<nom d'utilisateur>` par le nom d'utilisateur souhaité et `<mot de passe>` par le mot de passe souhaité pour le nouvel utilisateur.

3. Accordez les autorisations nécessaires au nouvel utilisateur. Par exemple, pour accorder tous les privilèges sur une base de données spécifique, exécutez la requête SQL suivante:

```sql
GRANT ALL PRIVILEGES ON DATABASE <nom_de_la_base_de_données> TO <username>;
```

Remplacez `<nom_de_la_base_de_données>` par le nom de la base de données à laquelle vous souhaitez accorder l'accès.

4. Validez que l'utilisateur a été créé avec succès en vérifiant la liste des utilisateurs dans la base de données PostgreSQL.

## Option B. Utilisation de pgAdmin

1. Ouvrez pgAdmin et connectez-vous à la base de données PostgreSQL.

2. Faites un clic droit sur le noeud `Login/Group Roles` et sélectionnez `Create` > `Login/Group Role`.

3. Dans l'onglet `General`, entrez le nom d'utilisateur désiré dans le champ `Name`.

![Ecran 1](/api/docs/UserGuide/Database/create-user-1.png)

4. Dans l'onglet `Definition`, entrez le mot de passe souhaité dans le champ `Password`.

5. Dans l'onglet `Role Privileges`, accordez les privilèges nécessaires au nouvel utilisateur.

6. Cliquez sur `Save` pour créer le nouvel utilisateur.

7. Validez que l'utilisateur a été créé avec succès en vérifiant la liste des utilisateurs dans la base de données PostgreSQL.