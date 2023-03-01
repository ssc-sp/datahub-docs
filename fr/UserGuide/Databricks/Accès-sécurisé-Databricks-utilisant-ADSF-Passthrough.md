---
remarks: Automatically translated with DeepL
source: \$1
---

# Résumé
- Datahub recommande d'utiliser la fonction AD Credential Pass-through de Databricks pour garantir la sécurité de l'accès de Databricks aux comptes de stockage.
- AD Credential Passthrough est une fonction disponible dans les databricks pour configurer le contrôle d'accès à l'aide de l'identification et des autorisations AD de l'utilisateur.
- L'identifiant AD de l'utilisateur de Databricks est transmis au stockage Azure Datalake Gen 2 et évalué par rapport aux fichiers et dossiers ACL.
- Il est recommandé d'utiliser les groupes AD pour séparer les responsabilités des groupes ayant le même accès.
- Tout utilisateur utilisant le cluster avec AD Credential activé sera évalué pour savoir si cet utilisateur a la permission appropriée pour effectuer l'action sur le fichier/dossier.

# Passage de l'accréditation AD de Databricks

![image.png](/.attachments/image-362c5896-3e0e-469c-80b6-557bb1184ebc.png)

![image.png](/.attachments/image-9ea2d0e1-44ef-4636-abef-0975c6c846b6.png)
