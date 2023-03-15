# Deleting Workspaces

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
### 4. Project Users Requests

```sql
DELETE r from Project_Users_Requests r left join [dbo].[Projects] p on p.Project_ID = r.Project_Id
WHERE p.Project_Acronym_CD in ('RETE','NCAR','NMCD','BWE','DEPR')
```

### 5. Projects

```sql
DELETE
  FROM [dbo].[Projects]
  WHERE Project_Acronym_CD in ('RETE','NCAR','NMCD','BWE','DEPR')
```  
### 6. Terraform
Here we use project TEST1 for illustration.

- Checkout the Terraform repo for the environment from Azure DevOps (e.g. datahub-project-infrastructure-dev for dev)
- Move the project directory (`terraform/projects/TEST1`) to `archive` folder
- Go into the new project folder (e.g. `archive/TEST1`)
  - Run `terraform init -backend-config="project.tfbackend"`
  - Run `terraform destroy` 
- Push the change up to Azure DevOps

 In the case that Terraform fails to destroy, proceed to the next step.
 
 ### 7. Manually Delete the Azure Resource Group
 If the Terraform cannot be used to destroy the project infrastructure resources, proceed with the manual steps below.
 
 - Go to Azure Portal and search Resource Groups by project code, delete the resource group
 - Delete the Terraform backend state file in Azure Storage Account
