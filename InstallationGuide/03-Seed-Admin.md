## Seed Admin

In order to create workspaces you need admin privileges. To start with, you need to seed an admin user. This user will be able to create other workspaces and assign other users as admins.

Run the following SQL script initialize the admin project:

```sql
INSERT INTO [dh-portal-projectdb].dbo.Projects (Sector_Name, Branch_Name, Division_Name, Contact_List, Project_Name, Project_Name_Fr, Project_Acronym_CD, Project_Admin, Project_Summary_Desc, Project_Summary_Desc_Fr, Project_Category, Initial_Meeting_DT, Number_Of_Users_Involved, Is_Private, Stage_Desc, Project_Status_Desc, Project_Phase, GC_Docs_URL, Project_Icon, Comments_NT, Last_Contact_DT, Next_Meeting_DT, Last_Updated_DT, Deleted_DT, Databricks_URL, PowerBI_URL, WebForms_URL, Data_Sensitivity, Is_Featured, DB_Name, DB_Server, DB_Type, OnboardingApplicationId, Project_Budget, MetadataAdded, BranchId, DivisionId, Last_Updated_UserId, SectorId, Project_Goal, Project_Status, datahubazuresubscriptionid, webappurlrewritingenabled) VALUES (N'DHPGLIST', null, null, N'<user_email>', N'Datahub Admins', null, N'DHPGLIST', N'<user_email>', null, null, null, N'0001-01-01 00:00:00.0000000', null, 0, null, N'Ongoing', N'Pending Approval', null, null, null, null, null, N'0001-01-01 00:00:00.0000000', null, null, null, null, N'Unclassified', 0, null, null, null, 0, 400.00, null, null, null, null, null, null, 1, 0, 0);
```

```sql
INSERT INTO [dh-portal-projectdb].dbo.Project_Users (User_ID, Project_ID, ApprovedUser, Approved_DT, IsAdmin, IsDataApprover, User_Name) VALUES (N'<user_aad_oid>', 1, N'<user_aad_oid>', N'2023-01-01 20:11:47.8260678', 1, 1, N'<user_email>');
```
