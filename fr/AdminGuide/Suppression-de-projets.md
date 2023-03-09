---
remarks: Automatically translated with DeepL
source: /AdminGuide/Deleting-Projects.md
draft: true
---

# Suppression de projets

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

### 4. Projets

``sql
DELETE
  FROM [dbo].[Projets]
  WHERE Project_Acronym_CD in ('RETE', 'NCAR', 'NMCD', 'BWE', 'DEPR')
```
