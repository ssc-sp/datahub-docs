# Databricks Guest Permissions Overview

## Users group

- Users group is special group. It inherits permissions from Azure resource group
- Users have by default read/write/cluster permissions

## Required permissions

- Guest should not be able to edit workbooks
- Guest might need to be able to start SQL Warehouses
- Guest should not be able to start cluster
- Guest needs to view workspaces

## SQL Warehouses

- Should provide better alternative to clusters for querying SQL data
- Faster startup time

## Guest Group

New guest group is probably best model for enabling access to external users.

- Create guest group
    - Guests should only be added to guest group and shouldn't be inherited from Azure resource group
- Restrict guest group with following Entitlements
    - [x] Workspace access
    - [x] Databricks SQL access
    - [ ] Disable "cluster creation"
- Adjust permissions in Workspace
    - Add guest group with _Can View_ permission
