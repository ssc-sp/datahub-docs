## Users

The users interact with the Datahub Portal to request new infrastructure and manage the workspaces. They are broken into the following categories

- Datahub Users
  - Project Publishers
  - Project Administrators
  - Project Contributors
- Datahub Administrators

## Datahub Portal

The portal is the primary interface for users to interact with the Datahub. It is a web application that allows users to create new infrastructure, manage existing infrastructure, and view the status of their requests.

## Message Queues

The Datahub uses message queues to communicate between the portal and the infrastructure.

- The portal puts requests on the queues to provision new infrastructure and pulls from the queues to update the status of the infrastructure.

- The infrastructure services pull messages from the queue to create new infrastructure and push messages to update the status of the infrastructure.

## Resourcing Manager

The Resourcing Manager is a service that manages the incoming infrastructure requests. It is responsible for creating, updating, and deleting the infrastructure via terraform.

## Infrastructure Repositories

There are two infrastructure repositories that are used to manage the infrastructure.

1. The public infrastructure repository is used to store the templates and modules that are used to provision the infrastructure. The templates are used to generate terraform referencing maintained modules that deploy the workspace features.

1. The private infrastructure repository is used to store the terraform for each workspace. The terraform is run independently from other workspaces to limit the blast radius of resource changes.

## Pipeline

The pipeline is responsible for running the terraform to provision the infrastructure. It is triggered by the Resourcing Manager when a new infrastructure request is received or when a pull request is made to the private infrastructure repository.
