---
remarks: Automatically translated with DeepL
source: /UserGuide/SensitiveData/Protected-B-Guidelines-for-Datahub-Projects.md
draft: true
---

---
onProfileInclude : nrcan
---

# Databricks

## Tables de ruches par rapport à SQL Server et Cosmos DB.

Datahub ne prend pas en charge le stockage des informations Protected B dans les tables Hive pour les raisons suivantes :
- Le contrôle d'accès dépend du compte de stockage sous-jacent et est complexe à intégrer aux permissions de Hive.
- L'audit des accès dans les tables Hive n'est pas possible et est requis pour les données Protégé B.

## SQL Server et Cosmos DB

Les bases de données SQL Server et Cosmos DB configurées par Datahub sont recommandées pour le stockage des données Protégé B.

## Contrôle d'accès aux objets de l'espace de travail
Utilisez les groupes pour gérer les autorisations granulaires (lecture vs écriture) et accordez l'accès aux dossiers/notesbooks en utilisant les groupes pour garantir que

## Contrôle d'accès au niveau du cluster
Utilisez les groupes pour gérer les autorisations de configuration, d'attachement et de redémarrage des clusters et accordez les autorisations au niveau du cluster à l'aide des groupes.

## Gestion du secret
Utilisez le coffre-fort de clés Azure qui a été spécifiquement attribué au projet pour gérer les secrets (mot de passe, jetons, certificats, etc.) qui seront utilisés dans les carnets Databricks et utilisez Secret Scope pour y accéder.
- Sécurisez le Secrete Scope afin de garantir que seuls les utilisateurs autorisés y aient accès.
- Sécurisez la chambre forte en utilisant les autorisations Active Directory pour vous assurer que seuls les utilisateurs qui ont besoin d'accéder à la chambre forte pour ce projet y ont accès.

## Accès au compte de stockage Azure
Tous les clusters qui accèdent au compte de stockage doivent être configurés avec "Credential Passthrough" afin que l'identifiant AD des utilisateurs de Databricks soit validé par rapport à l'ACL du compte de stockage pour garantir la sécurité de l'accès.
N'utilisez le compte de stockage Blob Gen2 que si l'espace de noms hiérarchique est activé.
- Ceci est nécessaire pour garantir que la fonction "Credential Passthrough" peut être utilisée pour accéder au compte de stockage.


