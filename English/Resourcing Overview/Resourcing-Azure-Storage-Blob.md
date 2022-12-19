## Sequence Diagram

This sequence diagram shows the steps involved in creating a new Azure storage blob.

```mermaid
sequenceDiagram
    actor User as User
    actor Admin as Datahub Admin

    participant Portal as Datahub Portal
    participant Queue as Message Queues
    participant RM as Resourcing Manager
    participant Repos as Repositories
    participant ADO as Pipeline

    autonumber


    User ->> Portal: request workspace storage
    activate Portal
    Portal ->> Portal: insert project resource record
    note over Portal: [Status] Requested
    Portal ->> User: refresh ui
    note over User: user can now view workspace storage with provision status
    Portal ->> Queue: add resource run message
    deactivate Portal
    note over Queue: /templates/azure-blob-storage

    Queue ->> RM: trigger resource run message
    activate RM
    RM ->> Repos: git clone repositories
    Repos ->> RM: latest;

    RM ->> RM: git checkout
    loop resource runs
      RM ->> RM: copy template
      RM ->> RM: extract & save variables
      RM ->> RM: git commit as user
    end

    RM ->> ADO: git push
    activate ADO
    RM ->> Queue: update status
    deactivate RM
    note over Queue: [Status] In Progress

    Queue ->> Portal: trigger status update
    activate Portal
    Portal ->> Portal: update workspace record
    deactivate Portal


    ADO ->> ADO: merge pull request
    ADO ->> ADO: run pipeline
    ADO ->> Queue: update status
    deactivate ADO
    note over Queue: [Status] Complete

    Queue ->> Portal: trigger status update
    activate Portal
    Portal ->> Portal: update workspace record
    deactivate Portal

```

# Message Examples

## New Project Template

Here is an example message from the Datahub Portal put on the `resource-run-request` queue to trigger the creation of a new project.

```json
{
  "modules": [
    {
      "name": "templates/azure-storage-blob",
      "version": "latest"
    }
  ],
  "workspace": {
    "name": "<workspace-name>",
    "acronym": "<workspace-acronym>",
    "organization": {
      "name": "<organization-name>",
      "code": "<organization-code>"
    },
    "users": []
  },
  "requestingUserEmail": "<user-email>"
}
```

## Pull Request Status Update Message

Here is an example message from the infrastructure puts on the queue to update the status of a workspace after a git push has been completed.

```json
{
  "project_cd": {
    "sensitive": false,
    "type": "string",
    "value": "<workspace-acronym>"
  },
  "azure_blob_storage_status": {
    "sensitive": false,
    "type": "string",
    "value": "In Progress"
  }
}
```

## Pipeline Status Update Message

Here is an example message from the infrastructure puts on the queue to update the status of a workspace after a pipeline has run.

> Note: the message will contain all of the terraform outputs, it is up to the message consumer to handle redundant updates.

```json
{
  "project_cd": {
    "sensitive": false,
    "type": "string",
    "value": "<workspace-acronym>"
  },
  "new_project_template": {
    "sensitive": false,
    "type": "string",
    "value": "Complete"
  },
  "azure_storage_blob_status": {
    "sensitive": false,
    "type": "string",
    "value": "Complete"
  },
  "azure_storage_blob_container_url": {
    "sensitive": false,
    "type": "string",
    "value": "https://<storage-account-name>.blob.core.windows.net/<container-name>"
  }
}
```
