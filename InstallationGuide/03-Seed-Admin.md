## Seed Admin

In order to create workspaces you need admin privileges. To start with, you need to seed an admin user. This user will be able to create other workspaces and assign other users as admins.

Run the following SQL script initialize the admin project:

```sql
INSERT [dbo].[Projects] ([Project_ID], [SectorId], [BranchId], [DivisionId], [Sector_Name], [Branch_Name], [Division_Name], [Contact_List], [Project_Name], [Project_Name_Fr], [Project_Acronym_CD], [Project_Budget], [Project_Admin], [Project_Summary_Desc], [Project_Summary_Desc_Fr], [Project_Goal], [Project_Category], [Initial_Meeting_DT], [Number_Of_Users_Involved], [Is_Private], [Is_Featured], [Data_Sensitivity], [Stage_Desc], [Project_Status_Desc], [Project_Status], [Project_Phase], [GC_Docs_URL], [Project_Icon], [Comments_NT], [Last_Contact_DT], [Next_Meeting_DT], [Last_Updated_DT], [Last_Updated_UserId], [Deleted_DT], [DatahubAzureSubscriptionId], [Databricks_URL], [PowerBI_URL], [WebForms_URL], [DB_Name], [DB_Server], [DB_Type], [OnboardingApplicationId], [MetadataAdded], [WebAppEnabled], [WebAppUrlRewritingEnabled], [OperationalWindow], [HasCostRecovery], [WebApp_URL], [Version], [GitRepo_URL], [HashedAPIToken], [ExpiryDate], [PreventAutoDelete]) VALUES (3, NULL, NULL, NULL, N'DHPGLIST', NULL, NULL, N'<user_email>', N'Datahub Admins', NULL, N'DHPGLIST', CAST(400.00 AS Decimal(18, 2)), N'<user_email>', NULL, NULL, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, N'Unclassified', NULL, N'Ongoing', 1, N'Pending Approval', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-10-10T18:01:25.9262677' AS DateTime2), N'1', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
```

```sql
INSERT [dbo].[Project_Users] ([ProjectUser_ID], [PortalUserId], [ApprovedPortalUserId], [RoleId], [Project_ID], [Approved_DT], [User_Name], [IsDataApprover], [IsAdmin], [User_ID], [ApprovedUser], [IsDataSteward]) VALUES (1, 1, 1, 1, 1, CAST(N'2023-01-01T20:11:47.8260678' AS DateTime2), N'<your.user@ssc-spc.gc.ca>', 1, 1, N'<user-aad-oid>', N'<user-aad-oid>', 0)
```
