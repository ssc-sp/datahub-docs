## Sequence Diagram

This sequence diagram shows the steps involved in creating a new workspace.

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


    User ->> Portal: request new workspace
    activate Portal
    Portal ->> Portal: insert workspace record
    note over Portal: [Status] Requested
    Portal ->> User: refresh ui
    note over User: user can now view workspace page with provision status
    Portal ->> Queue: add resource run message
    deactivate Portal
    note over Queue: /templates/new-project-template

    Queue ->> RM: trigger resource run message
    activate RM
    RM ->> Repos: git clone repositories
    Repos ->> RM: latest;

    RM ->> RM: git checkout -b <workspace-branch>
    loop resource runs
      RM ->> RM: copy template
      RM ->> RM: extract & save variables
      RM ->> RM: git commit as user
    end

    RM ->> ADO: git create pull request with user details
    activate ADO
    ADO ->> RM: pull request id
    deactivate ADO

    RM ->> Queue: update status
    deactivate RM
    note over Queue: [Status] Pending Approval

    Queue ->> Portal: trigger status update
    activate Portal
    Portal ->> Portal: update workspace record
    Portal ->> Admin: notify admin
    deactivate Portal

    activate Admin
    Admin ->> ADO: approve pull request
    deactivate Admin

    activate ADO
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
      "name": "templates/new-workspace-template",
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

Here is an example message from the infrastructure puts on the queue to update the status of a workspace after a pull request has been created.

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
    "value": "Pending Approval"
  }
}
```

## Pipeline Status Update Message

Here is an example message from the infrastructure puts on the queue to update the status of a workspace after a pipeline has run.

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
  }
}
```
