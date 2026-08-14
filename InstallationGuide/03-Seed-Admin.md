## Seed Admin

In order to create workspaces you need admin privileges. To start with, you need to seed an admin user. This user will be able to create other workspaces and assign other users as admins.

Run the following SQL script initialize the admin project:

```sql
INSERT INTO Projects (
    Contact_List, Project_Name, Project_Name_Fr, Project_Acronym_CD, 
    Project_Budget, Project_Admin, Project_Summary_Desc, Project_Summary_Desc_Fr, 
    Is_Private, Is_Featured, Data_Sensitivity, Project_Status_Desc, Project_Status, 
    Project_Phase, Project_Icon, Last_Updated_DT, Last_Updated_UserId, Deleted_DT, 
    DatahubAzureSubscriptionId, DB_Type, MetadataAdded, WebAppEnabled, 
    WebAppUrlRewritingEnabled, OperationalWindow, WebApp_URL, Version, 
    GitRepo_URL, HashedAPIToken, ExpiryDate, PreventAutoDelete, 
    AllowDatahubSupport, ParentGCHostingBudgetId, Created_DT, IsVersionUpdateRequested
)
VALUES (
    N'contact@canada.ca',                       -- Contact_List (nvarchar)
    N'Data Platform Migration',                 -- Project_Name (nvarchar)
    N'Migration de la plateforme de données',   -- Project_Name_Fr (nvarchar)
    N'DHPGLIST',                                -- Project_Acronym_CD (nvarchar)
    450000.00,                                  -- Project_Budget (decimal)
    N'Alex Tremblay',                           -- Project_Admin (nvarchar)
    N'Migrating core analytics infrastructure', -- Project_Summary_Desc (nvarchar)
    N'Migration de l''infrastructure',          -- Project_Summary_Desc_Fr (nvarchar)
    0,                                          -- Is_Private (bit: 0 = False)
    1,                                          -- Is_Featured (bit: 1 = True)
    N'High',                                    -- Data_Sensitivity (nvarchar)
    N'In Progress',                             -- Project_Status_Desc (nvarchar)
    2,                                          -- Project_Status (int)
    N'Phase 2',                                 -- Project_Phase (nvarchar)
    N'cloud-icon.png',                          -- Project_Icon (nvarchar)
    SYSUTCDATETIME(),                           -- Last_Updated_DT (datetime2 - current UTC system time)
    N'user_admin_01',                           -- Last_Updated_UserId (nvarchar)
    NULL,                                       -- Deleted_DT (datetime2 - null because it is active)
    1,                                          -- DatahubAzureSubscriptionId (int)
    N'SQL Server',                              -- DB_Type (nvarchar)
    1,                                          -- MetadataAdded (bit)
    1,                                          -- WebAppEnabled (bit)
    0,                                          -- WebAppUrlRewritingEnabled (bit)
    '2026-12-31 23:59:59.0000000',              -- OperationalWindow (datetime2)
    N'https://datahub.gc.ca',                   -- WebApp_URL (nvarchar)
    N'v2.4.1',                                  -- Version (nvarchar)
    N'https://github.com',                      -- GitRepo_URL (nvarchar)
    N'e3b0c44298fc1c149afbf4c8996fb92427ae41e', -- HashedAPIToken (nvarchar)
    '2028-08-10 14:30:00.0000000',              -- ExpiryDate (datetime2)
    0,                                          -- PreventAutoDelete (bit)
    '2026-09-01 00:00:00.0000000',              -- AllowDatahubSupport (datetime2)
    NULL,                                       -- ParentGCHostingBudgetId (int)
    '2026-08-10 14:30:00.0000000',              -- Created_DT (datetime2)
    0                                           -- IsVersionUpdateRequested (bit)
);

INSERT INTO Projects (
    Contact_List, Project_Name, Project_Name_Fr, Project_Acronym_CD, 
    Project_Budget, Project_Admin, Project_Summary_Desc, Project_Summary_Desc_Fr, 
    Is_Private, Is_Featured, Data_Sensitivity, Project_Status_Desc, Project_Status, 
    Project_Phase, Project_Icon, Last_Updated_DT, Last_Updated_UserId, Deleted_DT, 
    DatahubAzureSubscriptionId, DB_Type, MetadataAdded, WebAppEnabled, 
    WebAppUrlRewritingEnabled, OperationalWindow, WebApp_URL, Version, 
    GitRepo_URL, HashedAPIToken, ExpiryDate, PreventAutoDelete, 
    AllowDatahubSupport, ParentGCHostingBudgetId, Created_DT, IsVersionUpdateRequested
)
VALUES (
    N'contact@canada.ca',                       -- Contact_List (nvarchar)
    N'Data Platform Migration',                 -- Project_Name (nvarchar)
    N'Migration de la plateforme de données',   -- Project_Name_Fr (nvarchar)
    N'DHAPPRV',                                -- Project_Acronym_CD (nvarchar)
    450000.00,                                  -- Project_Budget (decimal)
    N'Alex Tremblay',                           -- Project_Admin (nvarchar)
    N'Migrating core analytics infrastructure', -- Project_Summary_Desc (nvarchar)
    N'Migration de l''infrastructure',          -- Project_Summary_Desc_Fr (nvarchar)
    0,                                          -- Is_Private (bit: 0 = False)
    1,                                          -- Is_Featured (bit: 1 = True)
    N'High',                                    -- Data_Sensitivity (nvarchar)
    N'In Progress',                             -- Project_Status_Desc (nvarchar)
    2,                                          -- Project_Status (int)
    N'Phase 2',                                 -- Project_Phase (nvarchar)
    N'cloud-icon.png',                          -- Project_Icon (nvarchar)
    SYSUTCDATETIME(),                           -- Last_Updated_DT (datetime2 - current UTC system time)
    N'user_admin_01',                           -- Last_Updated_UserId (nvarchar)
    NULL,                                       -- Deleted_DT (datetime2 - null because it is active)
    1,                                          -- DatahubAzureSubscriptionId (int)
    N'SQL Server',                              -- DB_Type (nvarchar)
    1,                                          -- MetadataAdded (bit)
    1,                                          -- WebAppEnabled (bit)
    0,                                          -- WebAppUrlRewritingEnabled (bit)
    '2026-12-31 23:59:59.0000000',              -- OperationalWindow (datetime2)
    N'https://datahub.gc.ca',                   -- WebApp_URL (nvarchar)
    N'v2.4.1',                                  -- Version (nvarchar)
    N'https://github.com',                      -- GitRepo_URL (nvarchar)
    N'e3b0c44298fc1c149afbf4c8996fb92427ae41e', -- HashedAPIToken (nvarchar)
    '2028-08-10 14:30:00.0000000',              -- ExpiryDate (datetime2)
    0,                                          -- PreventAutoDelete (bit)
    '2026-09-01 00:00:00.0000000',              -- AllowDatahubSupport (datetime2)
    NULL,                                       -- ParentGCHostingBudgetId (int)
    '2026-08-10 14:30:00.0000000',              -- Created_DT (datetime2)
    0                                           -- IsVersionUpdateRequested (bit)
);

```

```sql
INSERT INTO Projects (
    [PortalUserId],
    [ApprovedPortalUserId],
    [RoleId],
    [Project_ID],
    [Approved_DT],
    [IsDataSteward])
VALUES (
    1,
    1,
    3,
    5,
    CAST (N'2023-01-01T20:11:47.8260678' AS DATETIME2),
    0
);
```
```
insert into versiontags (Tag ,
IsActive ,
CreatedDate ,
VersionDescription ,
VersionDescriptionFr,
AnnouncementCreated ) values('v6.2.13','True', getdate(), 'new','new','False');
```