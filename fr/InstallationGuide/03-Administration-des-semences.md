---
remarks: Automatically translated with DeepL
source: /InstallationGuide/03-Seed-Admin.md
draft: true
---

## Seed Admin

Pour créer des espaces de travail, vous devez disposer de privilèges d'administrateur. Pour commencer, vous devez créer un utilisateur admin. Cet utilisateur pourra créer d'autres espaces de travail et désigner d'autres utilisateurs comme administrateurs.

Exécutez le script SQL suivant pour initialiser le projet d'administration :

``sql
INSERT INTO [dh-portal-projectdb].dbo.Projects (Sector_Name, Branch_Name, Division_Name, Contact_List, Project_Name, Project_Name_Fr, Project_Acronym_CD, Project_Admin, Project_Summary_Desc, Project_Summary_Desc_Fr, Project_Category, Initial_Meeting_DT, Number_Of_Users_Involved, Is_Private, Stage_Desc, Project_Status_Desc, Project_Phase, GC_Docs_URL, Project_Icon, Comments_NT, Last_Contact_DT, Next_Meeting_DT, Last_Updated_DT, Deleted_DT, Databricks_URL, PowerBI_URL, WebForms_URL, Data_Sensitivity, Is_Featured, DB_Name, DB_Server, DB_Type, OnboardingApplicationId, Project_Budget, MetadataAdded, BranchId, DivisionId, Last_Updated_UserId, SectorId, Project_Goal, Project_Status) VALUES (N'DHPGLIST', null, null, N'<user_email>', N'Datahub Admins', null, N'DHPGLIST', N'<user_email>', null, null, null, N'0001-01-01 00 :00:00.0000000', null, 0, null, N'Ongoing', N'Pending Approval', null, null, null, null, null, N'0001-01 00:00:00.0000000', null, null, null, N'Unclassified', 0, null, null, null, 0, 400.00, null, null, null, null, null, null, null, null, 1) ;
```

``sql
INSERT INTO [dh-portal-projectdb].dbo.Project_Users (User_ID, Project_ID, ApprovedUser, Approved_DT, IsAdmin, IsDataApprover, User_Name) VALUES (N'<user_aad_oid>', 1, N'<user_aad_oid>', N'2023-01-01 20:11:47.8260678', 1, 1, N'<user_email>') ;
```
