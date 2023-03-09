# Deleting Projects

Deletion of projects requires:
1. Database Deletion (manual see below)
1. Terraform resource deletion

## Database Deletion 

### 1. Whitelist 

```sql
DELETE w from Project_Whitelists w left join [dbo].[Projects] p on p.Project_ID = w.ProjectId
WHERE p.Project_Acronym_CD in ('RETE','NCAR','NMCD','BWE','DEPR')
```

### 2. Project Users

```sql
DELETE u from Project_Users u left join [dbo].[Projects] p on p.Project_ID = u.Project_Id
WHERE p.Project_Acronym_CD in ('RETE','NCAR','NMCD','BWE','DEPR')
```

### 3. Project Requests

```sql
DELETE r from Project_Requests r left join [dbo].[Projects] p on p.Project_ID = r.Project_Id
WHERE p.Project_Acronym_CD in ('RETE','NCAR','NMCD','BWE','DEPR')
```

### 4. Projects

```sql
DELETE
  FROM [dbo].[Projects]
  WHERE Project_Acronym_CD in ('RETE','NCAR','NMCD','BWE','DEPR')
```  