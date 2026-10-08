## Overview

This page gives a quick map of how Datahub provisions and manages cloud infrastructure for a workspace. The flow begins with a user request in the portal, passes through messaging and the resourcing manager, and ends with Terraform project files generated from shared templates stored in the module repository.

## Workspace / Project

A workspace consists of:

- a folder in the private infrastructure repository with the following:
  - its own remote Terraform state independent of other workspaces
  - a Terraform module for the base workspace requirements
  - multiple Terraform modules for the workspace's resources
- multiple rows in the `Project_Users` table
  - including the `isAdmin` role for the workspace
- an entry in the `Datahub_Projects` table
- multiple rows in the `Project_Resources` table that contain the output of the provisioned resource modules from the public module repository

## Architectural Context

There are six main components involved in this process:

1. Users
1. Datahub Portal
1. Message Queues
1. Resourcing Manager
1. Git Repositories (Infrastructure & Modules)
1. Pipelines

These components have clear responsibility boundaries and work together to provision and manage each workspace's infrastructure.

> For more information on the communication between the services, see [Service Components](Resourcing-Servicing-Components.md).

## Repository and Template Flow

The module repository acts as the shared template source for the workspace infrastructure. The private infrastructure repository stores the generated Terraform for each workspace and the branch/PR workflow used to review and merge changes.

> For the end-to-end repository flow, including how template files are copied into each workspace project, see [Module repository provisioning flow](module-repository-provisioning-flow.md).

## Terraform Structures

The cloud infrastructure is provisioned via Terraform. Each workspace has its own directory and state so resource changes stay isolated to a single project.

The private workspace repository consumes templates and modules from the public module repository. Those templates generate Terraform that references maintained modules to deploy workspace features.

> For more information on the Terraform structure, see [Terraform Structures](Resourcing-Terraform-Structures.md).

## Resource Runs

A resource run is the process of provisioning a new resource or updating an existing one. It is triggered by user actions in the Portal and executed by the Resourcing Manager.

Messaging between the Portal and the infrastructure services is handled by the Message Queues.

> For more information on resource runs, see [Resource Runs](Resourcing-Resource-Runs.md).

## Related Documents

- [Module repository provisioning flow](module-repository-provisioning-flow.md)
- [Service Components](Resourcing-Servicing-Components.md)
- [Terraform Structures](Resourcing-Terraform-Structures.md)
- [Message Queues](Resourcing-Message-Queues.md)
- [Resource Runs](Resourcing-Resource-Runs.md)
- [New Project Template](Resourcing-New-Project-Template.md)
- [Azure Storage Blob](Resourcing-Azure-Storage-Blob.md)
