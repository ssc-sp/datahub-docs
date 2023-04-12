# Change Management Process for Datahub

## Use Case 1: Hot fixes / Patches

### Branches

- Production branch
- Commits gets pulled back into develop branch

### Examples

- Database data fixes/updates
- Minor UI updates
- Terraform minor updates
- Admin pages

### 1. Recording and planning 

- Hotfix tag
- Draft releases in Github to track what has been changes (only owners can see it)
- PR needs to pass build

### 2. Approval

- PR approval
- Release pipeline approval

### 3. Communication 

- N/A - deployment process takes less than 10 minutes
- Visible in release notes

### 4. Deployment

- Deployment ideally done after 5pm Pacific (8pm Eastern)
- Minor impact expected for users

### 5. Review

Landing tests to be performed for key features:
- [ ] File explorer
- [ ] Databricks access

## Use Case 2: Minor and Major Versions

### Examples

- Database schema updates
- New public page
- Major UI updates
- Terraform major updates

### 1. Recording and planning 

- Schedule planned in advanced based on sprints
- Milestone dates on Github

### 2. Approval

- PR approval
- Release pipeline approval
- Management approval

### 3. Communication 

- Downtime of portal to be announced on Office Hours
- Maintenance page available when new version is being deployed
- Banner to be considered later

### 4. Deployment

- Maintenance page
- Offline access to databricks to be considered later from maintenance page
- 2-12hrs of downtime
- Monday-Thursday 

### 5. Review

Landing tests to be performed for key features:
- [ ] File explorer
- [ ] Databricks access
- [ ] New areas affected
- [ ] Resources
- [ ] User Management

