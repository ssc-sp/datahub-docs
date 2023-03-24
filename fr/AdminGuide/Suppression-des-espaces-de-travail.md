---
remarks: Automatically translated with DeepL
source: /AdminGuide/Deleting-Workspaces.md
draft: true
---

# Suppression des espaces de travail

La suppression des projets nécessite :
1. Suppression de la base de données (manuel voir ci-dessous)
1. Suppression des ressources Terraform

## Suppression de la base de données

### 1. Liste blanche

``sql
DELETE w from Project_Whitelists w left join [dbo].[Projects] p on p.Project_ID = w.ProjectId
WHERE p.Project_Acronym_CD in ('RETE', 'NCAR', 'NMCD', 'BWE', 'DEPR')
```

### 2. Utilisateurs du projet

``sql
DELETE u from Project_Users u left join [dbo].[Projects] p on p.Project_ID = u.Project_Id
WHERE p.Project_Acronym_CD in ('RETE', 'NCAR', 'NMCD', 'BWE', 'DEPR')
```

### 3. Demandes de projets

``sql
DELETE r from Project_Requests r left join [dbo].[Projects] p on p.Project_ID = r.Project_Id
WHERE p.Project_Acronym_CD in ('RETE', 'NCAR', 'NMCD', 'BWE', 'DEPR')
```
### 4. Demandes des utilisateurs du projet

``sql
DELETE r from Project_Users_Requests r left join [dbo].[Projects] p on p.Project_ID = r.Project_Id
WHERE p.Project_Acronym_CD in ('RETE', 'NCAR', 'NMCD', 'BWE', 'DEPR')
```

### 5. Projets

``sql
DELETE
  FROM [dbo].[Projets]
  WHERE Project_Acronym_CD in ('RETE', 'NCAR', 'NMCD', 'BWE', 'DEPR')
```
  ### 6. Terraform
Nous utilisons ici le projet TEST1 à titre d'illustration.

- Extraire le repo Terraform pour l'environnement à partir d'Azure DevOps (par exemple, datahub-project-infrastructure-dev pour dev).
- Déplacer le répertoire du projet (`terraform/projects/TEST1`) vers le dossier `archive`.
- Allez dans le dossier du nouveau projet (par exemple `archive/TEST1`)
  - Exécutez `terraform init -backend-config="project.tfbackend"`.
  - Exécuter `terraform destroy`
- Pousser le changement jusqu'à Azure DevOps

 Dans le cas où Terraform ne parvient pas à détruire, passez à l'étape suivante.

 ### 7. Supprimer manuellement le groupe de ressources Azure
 Si Terraform ne peut pas être utilisé pour détruire les ressources de l'infrastructure du projet, procédez aux étapes manuelles ci-dessous.

 - Allez sur Azure Portal et recherchez les groupes de ressources par code de projet, puis supprimez le groupe de ressources.
 - Supprimer le fichier d'état du backend Terraform dans le compte de stockage Azure
