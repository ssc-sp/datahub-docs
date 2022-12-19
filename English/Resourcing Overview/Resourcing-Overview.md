## Overview

This is a quick overview of the logic flow for creating new infrastructure resources with Datahub's cloud infrastructure.

## Workspace / Project

A workspace wholly consists of

- a folder in the private infrastructure repository with the following:
  - it's own remote terraform state independent of any other workspace
  - a terraform module for the base workspace requirements
  - multiple terraform modules for the workspace's resources
- multiple entries for the users in the `Project_Users` table
  - including the `isAdmin` role for the workspace
- an entry in the `Datahub_Projects` table
- multiple entries in the `Project_Resources` table that containes the output of the provisioned resource modules from the public module repository

## Architectural Context

There are six main components to this process:

1. Users
1. Datahub Portal
1. Message Queues
1. Resourcing Manager
1. Git Repositories (Infrastructure & Modules)
1. Pipelines

These components have minimal complexity and concise responsibility boundaries. They communicate with each other to provision and manage each workspace's infrastructure.

> For more information on the communications between the services, see the [Service Components](Resourcing-Service-Components.md).

## Terraform Structures

The cloud infrastructure is provisioned using Terraform. The Terraform for each workspace is stored in it's own directory and run independently from other workspaces to limit the blast radius of resource changes.

The private workspace infrastructure consumes the templates and modules from the public infrastructure repository. The templates are used to generate terraform referencing maintained modules that deploy the workspace features.

> For more information on the Terraform structure, see the [Terraform Structures](Resourcing-Terraform-Structures) page.

## Resource Runs

A resource run is the process of provisioning a new resource or updating an existing resource. The resource run is triggered by user actions in the Portal to create or update a resource. The resource run is executed by the Resourcing Manager.

Messaging between the Portal and the infrastructure services is handled by the Message Queues.

> For more information on the Resource Runs, see the [Resource Runs](Resourcing-Resource-Runs.md) page.
