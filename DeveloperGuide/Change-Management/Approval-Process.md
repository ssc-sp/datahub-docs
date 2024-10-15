# Approval Process for FSDH Release and Change Management

## 1. Introduction

Azure DevOps provides a mechanism for creating gates and approvals in release pipelines. These approvals can be required before and after deploying an environment. They ensure that changes are reviewed and authorized before being promoted to the next stage of your delivery process, especially to production.

## 2. Roles and Authorizations

FSDH uses the following user roles in the Azure DevOps project:


| Group name | Permissions | Membership |
|-- |--|--|
|Build Administrators| Administer build resources and build permissions for the project. Members can manage test environments, create test runs, and manage builds. | Users who define and manage build pipelines|
|Contributors|Contribute fully to the project code base and work item tracking. The main permissions they don't have are permissions that manage or administer resources.| All users in FSDH team|
|Readers | View project information, the code base, work items, and other artifacts but not modify them. | External team users and guest users|
|Project Administrators |Administer all aspects of teams and project, although they can't create team projects.| Users who require the following functions: Manage user permissions, create or edit teams, modify team settings, define area or iteration paths, or customize work item tracking. |
|Release Administrators | Manage all release operations. |Users who define and manage release pipelines|


## 3. Approval

### 3.1. Code

- **Purpose**: Project contributors make changes to the code using a feature or bug branch. The branch is then merged to the "trunk" after approval.
- **Approval Process**: 
  - **Approvers**: Contributors who initiated the change must seek peer reviews. Reviewer, usually other team contributors, review and approve the merge.
  - **Result**: Code change merged to a trunk branch and will subject to additional testing.

### 3.2. Build

- **Purpose**: Approved code goes through automated build and test process 
- **Approval Process**:
 - **Approvers**: Build Administrators approves the build pipelines. Sometimes the build is automatically triggered by code change after merging.
  - **Result**: Build is run and testing is run

### 3.3. Deploy

- **Purpose**: Successful build may be deployed to selected environment if approved
- **Approval Process**:
 - **Approvers**: Release Administrators approves the release pipelines. Approval is a manual step built into the release pipeline (i.e. YAML file)
  - **Result**: Build is deployed if approved or abandoned if not approved

## 4. Roles and Responsibilities in Agile Environment

- Build Administrators: Administer build resources and build permissions for the project
- Contributors: Contribute fully to the project code base and work item tracking
- Readers: View project information, the code base, work items, and other artifacts but not modify them
- Release Administrators: Manage and approve all release operations


