# Account Management and Access control of workspaces  

The account management and access control and ongoing maintenance of workspaces are the responsibility of the departments using the Federal Science Data Hub (FSDH). Within the department, the role of access control, account management and ongoing maintenance is the responsibility of the Workspace lead. A departmental user requesting access to the FSDH portal is assigned the role of Workspace lead and their responsibilities, and each user's responsibilities are detailed below:  

The following are roles and responsibilities for components within the workspace. 

| Role | Databricks Role | Web Application Role | Storage Role | PostgreSQL Role |
| --- | --- | --- | --- | --- |
| Workspace lead | Administrators <br/> - Workspace Access <br/> - Databricks SQL Access <br/> - Allow unrestricted cluster creation <br/> - allow-instance-pool-create | Access Configuration, Open web application | Browse, Upload, Download, Generate Token | Database Access Connection Info |
| Administrator | Administrators <br/> - Workspace Access <br/> - Databricks SQL Access <br/> - Allow unrestricted cluster creation <br/> - allow-instance-pool-create | Access Configuration, Open web application | Browse, Upload, Download, Generate Token | Database Access Connection Info |
| Collaborator | Users <br /> - Workspace Access <br/> - Databricks SQL access | Open web application | Browse, Upload, Download | No role |
| Guest | No Databricks Access | Open web application | No Storage Access | No role |
| Data Steward | Users <br/> - Workspace Access <br/> - Databricks SQL Access | Open web application | Browse, Upload, Download | No role |

The detail roles and responsibilities are in Annex 1 and 2 of the [Terms and Conditions](https://163gc.sharepoint.com/:w:/r/sites/ScienceProgram/Shared%20Documents/Data%20Solutions%20for%20Science/Federal%20Science%20DataHub%20(FSDH)/Project%20Planning%20%26%20Execution/Cyber%20Security/Gate%204/Evidence/Terms%26Conditions.docx?d=w1c8fdbc8e07d4cf6b1dc68fd3394e227&csf=1&web=1&e=u7GGfp).

5.1 Granting access and assigning a role within a workspace 

The user is assigned the workspace lead role when they request access to the FSDG portal by completing the request via the Salesforce Portal. The user must agree to the [Terms and Conditions](https://163gc.sharepoint.com/:w:/r/sites/ScienceProgram/Shared%20Documents/Data%20Solutions%20for%20Science/Federal%20Science%20DataHub%20(FSDH)/Project%20Planning%20%26%20Execution/Cyber%20Security/Gate%204/Evidence/Terms%26Conditions.docx?d=w1c8fdbc8e07d4cf6b1dc68fd3394e227&csf=1&web=1&e=u7GGfp) and fulfil all funding and policy obligations before granting access. The workspace lead can then assign additional roles by inviting users to the workspace. The users must agree to the [Terms and Conditions](https://163gc.sharepoint.com/:w:/r/sites/ScienceProgram/Shared%20Documents/Data%20Solutions%20for%20Science/Federal%20Science%20DataHub%20(FSDH)/Project%20Planning%20%26%20Execution/Cyber%20Security/Gate%204/Evidence/Terms%26Conditions.docx?d=w1c8fdbc8e07d4cf6b1dc68fd3394e227&csf=1&web=1&e=u7GGfp) and meet all departmental policies and requirements associated with their role (for example, Reliability security clearance). In addition, the users must have a valid Government of Canada email account. Workspace lead should consult with their Departmental IT Security authorities to ensure compliance with Access Management requirements established by the Directive on Security Management ([Directive on Security Management- Canada.ca](https://www.tbs-sct.canada.ca/pol/doc-eng.aspx?id=32611) - B.2.3.2)  

5.2 Managing Access control or account type change 

Departments and, specifically, the workspace lead are responsible for notifying if any account/role changes within the workspace occur. If a workspace lead is no longer the lead of the workspace, they are responsible for assigning a new workspace lead. 

Note: If the workspace lead abandons the workspace (leaves the organization), all roles within that workspace can submit a support request to FSDH requesting the assignment of a new workspace lead.  

In addition, all roles within the workspace are responsible for notifying the workspace lead if:  

- When access is no longer needed or required.   
- Access is changed or no longer needed due to transfer or termination  
- When access privileges are associated with account types or if new account types are created due to a system change or update?  
- When individual workspace usage or need-to-know changes.  

The workspace lead is responsible for reviewing the users within its workspace regularly. In the case the access to the workspace (termination of employment, moving projects, departments, etc.) is no longer required for the user. The workspace lead must:  

- Disable FSDH workspace access within two business days. 
- Advise the FSDH team of the termination so that the FSDH team can terminate system-wide access. 