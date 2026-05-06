# Message Bus Overview

DataHub uses **Azure Service Bus queues** to decouple its components. The three main participants are:

| Participant | Role |
|---|---|
| **Portal** | ASP.NET Core web application; publishes requests and consumes capacity updates |
| **Datahub.Functions** | Azure Functions app; the primary consumer of most queues |
| **ResourceProvisioner\_PyFunctions** | Python Azure Functions app; provisions/syncs workspace infrastructure |

---

## Queue Reference

| Queue name | Message type | Publisher(s) | Consumer(s) |
|---|---|---|---|
| `pong-queue` | pong response | Datahub.Functions | Health-probe callers |
| `bug-report` | `BugReportMessage` | Portal, ResourceProvisioner\_PyFunctions | `BugReport` function |
| `email-notification` | `EmailRequestMessage` | Various functions & services | `EmailNotificationHandler` |
| `infrastructure-health-check` | `InfrastructureHealthCheckMessage` | `CheckInfrastructureScheduled` (timer), HTTP trigger | `CheckInfrastructureStatusQueue` |
| `infrastructure-health-check-results` | `InfrastructureHealthCheckResultMessage` | `CheckInfrastructureStatusQueue`, ResourceProvisioner\_PyFunctions | `RecordInfrastructureStatusQueue` |
| `project-capacity-update` | `ProjectCapacityUpdateMessage` | `TerraformOutputHandler` | Portal infrastructure services |
| `project-inactive` | `ProjectInactiveMessage` | `ProjectInactivityNotifier` | `ProjectInactiveHandler` |
| `project-inactivity-notification` | `ProjectInactivityNotificationMessage` | `InactivityScheduler` (timer) | `ProjectInactivityNotifier` |
| `project-usage-notification` | `ProjectUsageNotificationMessage` | `ProjectUsageUpdater` | `ProjectUsageNotifier` |
| `project-usage-update` | `ProjectUsageUpdateMessage` | `ProjectUsageScheduler` (timer) | `ProjectUsageUpdater` |
| `user-inactivity-notification` | `UserInactivityNotificationMessage` | `InactivityScheduler` (timer) | `UserInactivityNotifier` |
| `terraform-output-handler` | Terraform key/value JSON | Azure DevOps Terraform pipelines | `TerraformOutputHandler` |
| `workspace-app-service-configuration` | `WorkspaceAppServiceConfigurationMessage` | Portal / resource provisioning flow | `ConfigureWorkspaceAppService` |
| `virus-scan-notification` | `VirusScanNotificationMessage` | Virus scan pipeline | `VirusScanNotificationHandler` |
| `virus-scan-user-status` | `VirusScanUserStatusMessage` | Virus scan pipeline | `VirusScanUserStatusHandler` |
| `databricks-sync-output` | Databricks sync result | ResourceProvisioner\_PyFunctions | `TerraformOutputHandler` |
| `keyvault-sync-output` | Key Vault sync result | ResourceProvisioner\_PyFunctions, Portal | `TerraformOutputHandler` |
| `storage-sync-output` | Storage sync result | ResourceProvisioner\_PyFunctions, Portal | `TerraformOutputHandler` |
| `resource-run-request` | `CreateResourceRunCommand` | Portal (`ResourceMessagingService`) | `ResourceProvisioner.Functions.ResourceRunRequest` |
| `user-run-request` | `WorkspaceDefinition` | Portal (`ResourceMessagingService`) | ResourceProvisioner\_PyFunctions |

---

## Message Flows by Domain

### 1. Workspace Resource Provisioning

When a workspace resource is created or updated, the Portal sends a `CreateResourceRunCommand` to `resource-run-request`. The ResourceProvisioner clones the infrastructure repo, renders Terraform templates, and opens an ADO pull request. After the Terraform pipeline runs successfully, it posts outputs to `terraform-output-handler`, which then fans out capacity and sync update messages.

```mermaid
sequenceDiagram
    participant Portal
    participant RRQ as resource-run-request
    participant RP as ResourceProvisioner.Functions
    participant ADO as Azure DevOps<br/>(Terraform pipeline)
    participant TOQ as terraform-output-handler
    participant TOH as TerraformOutputHandler
    participant PCQ as project-capacity-update
    participant PortalInfra as Portal Infra Services

    Portal->>RRQ: CreateResourceRunCommand
    RRQ->>RP: ResourceRunRequest trigger
    RP->>ADO: Opens Terraform PR / triggers pipeline
    ADO->>TOQ: Terraform outputs (key/value JSON)
    TOQ->>TOH: TerraformOutputHandler trigger
    TOH->>PCQ: ProjectCapacityUpdateMessage
    PCQ->>PortalInfra: Update storage/budget capacity
```

### 2. Workspace User Synchronisation

When workspace membership changes, the Portal enqueues a `WorkspaceDefinition` to `user-run-request`. The Python provisioner syncs users across Databricks, Key Vault, and Storage, then publishes results and a health-check status.

```mermaid
sequenceDiagram
    participant Portal
    participant URQ as user-run-request
    participant PyRP as ResourceProvisioner_PyFunctions
    participant DSQ as databricks-sync-output
    participant KSQ as keyvault-sync-output
    participant SSQ as storage-sync-output
    participant HCRQ as infrastructure-health-check-results
    participant TOH as TerraformOutputHandler
    participant RSQH as RecordInfrastructureStatusQueue
    participant DB as Database

    Portal->>URQ: WorkspaceDefinition
    URQ->>PyRP: SynchronizeWorkspaceUsersQueueTrigger
    PyRP->>DSQ: Databricks sync result
    PyRP->>KSQ: Key Vault sync result
    PyRP->>SSQ: Storage sync result
    PyRP->>HCRQ: Health check result
    DSQ->>TOH: Process sync output
    KSQ->>TOH: Process sync output
    SSQ->>TOH: Process sync output
    HCRQ->>RSQH: RecordInfrastructureStatusQueue trigger
    RSQH->>DB: Persist health status
```

### 3. Infrastructure Health Checks

Health checks can be triggered on a schedule or via HTTP. The checker publishes results, which are persisted by a dedicated handler.

```mermaid
sequenceDiagram
    participant Timer as CheckInfrastructureScheduled<br/>(timer trigger)
    participant HTTP as CheckInfrastructureStatusHttp<br/>(HTTP trigger)
    participant IHCQ as infrastructure-health-check
    participant Checker as CheckInfrastructureStatusQueue
    participant HCRQ as infrastructure-health-check-results
    participant Recorder as RecordInfrastructureStatusQueue
    participant DB as Database

    Timer->>IHCQ: InfrastructureHealthCheckMessage ("all")
    HTTP->>IHCQ: InfrastructureHealthCheckMessage
    IHCQ->>Checker: Queue trigger
    Checker->>HCRQ: InfrastructureHealthCheckResultMessage
    HCRQ->>Recorder: Queue trigger
    Recorder->>DB: Persist health check result
```

### 4. Project Usage & Budget Notifications

A timer scheduler enqueues one update message per workspace. The updater fetches cost and storage data; if a budget threshold is crossed it enqueues a notification message, which is sent as an email via GC Notify.

```mermaid
sequenceDiagram
    participant Scheduler as ProjectUsageScheduler<br/>(timer trigger)
    participant UPQ as project-usage-update
    participant Updater as ProjectUsageUpdater
    participant PUNQ as project-usage-notification
    participant Notifier as ProjectUsageNotifier
    participant ENQ as email-notification
    participant EmailHandler as EmailNotificationHandler
    participant GCNotify as GC Notify / SMTP

    Scheduler->>UPQ: ProjectUsageUpdateMessage (one per workspace)
    UPQ->>Updater: Queue trigger
    Updater-->>PUNQ: ProjectUsageNotificationMessage<br/>(if threshold crossed)
    PUNQ->>Notifier: Queue trigger
    Notifier->>ENQ: EmailRequestMessage
    ENQ->>EmailHandler: Queue trigger
    EmailHandler->>GCNotify: Send email
```

### 5. Inactivity Notifications

A shared timer (`InactivityScheduler`) fans out messages for both inactive projects and inactive users. Each notifier sends emails and may trigger further actions such as workspace deletion or account disabling.

```mermaid
sequenceDiagram
    participant Scheduler as InactivityScheduler<br/>(timer trigger)
    participant PINQ as project-inactivity-notification
    participant PIN as ProjectInactivityNotifier
    participant PRDQ as project-inactive
    participant PRD as ProjectInactiveHandler
    participant UINQ as user-inactivity-notification
    participant UIN as UserInactivityNotifier
    participant ENQ as email-notification
    participant EmailHandler as EmailNotificationHandler

    Scheduler->>PINQ: ProjectInactivityNotificationMessage (one per inactive project)
    Scheduler->>UINQ: UserInactivityNotificationMessage (one per inactive user)

    PINQ->>PIN: Queue trigger
    PIN->>ENQ: EmailRequestMessage (notify project leads)
    PIN-->>PRDQ: ProjectInactiveMessage<br/>(if past deletion threshold)
    PRDQ->>PRD: Queue trigger (deletion logic – not yet implemented)

    UINQ->>UIN: Queue trigger
    UIN->>ENQ: EmailRequestMessage (notify user)
    ENQ->>EmailHandler: Queue trigger
    EmailHandler->>EmailHandler: Send via SMTP (MailKit)
```

### 6. Bug Reporting

Both the Portal (user-submitted reports) and the Python provisioner (workspace sync errors) publish to the `bug-report` queue. The handler posts to Microsoft Teams, creates an ADO work item, and sends a GC Notify email.

```mermaid
sequenceDiagram
    participant Portal
    participant PyRP as ResourceProvisioner_PyFunctions<br/>(send_exception_to_service_bus)
    participant BRQ as bug-report
    participant BR as BugReport function
    participant Teams as Microsoft Teams
    participant ADO as Azure DevOps<br/>(work item)
    participant GCNotify as GC Notify

    Portal->>BRQ: BugReportMessage
    PyRP->>BRQ: BugReportMessage (sync error)
    BRQ->>BR: Queue trigger
    BR->>Teams: Post message
    BR->>ADO: Create work item
    BR->>GCNotify: Send email
```

### 7. Virus Scanning

After a file is scanned, two messages are published: one for the user notification and one for a status/audit update.

```mermaid
sequenceDiagram
    participant Scanner as Virus Scan Pipeline /<br/>Storage Event Handler
    participant VSNQ as virus-scan-notification
    participant VSN as VirusScanNotificationHandler
    participant VSSQ as virus-scan-user-status
    participant VSS as VirusScanUserStatusHandler
    participant Portal as Portal (in-app notification)
    participant DB as Database / Audit Log

    Scanner->>VSNQ: VirusScanNotificationMessage
    Scanner->>VSSQ: VirusScanUserStatusMessage
    VSNQ->>VSN: Queue trigger
    VSN->>Portal: Create in-app system notification for file owner
    VSSQ->>VSS: Queue trigger
    VSS->>DB: User status update / audit log (placeholder)
```

### 8. Workspace App Service Configuration

When an App Service needs to be configured for a workspace, the Portal enqueues a message that triggers an ADO pipeline.

```mermaid
sequenceDiagram
    participant Portal
    participant WASCQ as workspace-app-service-configuration
    participant WASC as ConfigureWorkspaceAppService
    participant ADO as Azure DevOps<br/>(App Service config pipeline)

    Portal->>WASCQ: WorkspaceAppServiceConfigurationMessage
    WASCQ->>WASC: Queue trigger
    WASC->>ADO: Trigger App Service configuration pipeline
```

### 9. Ping / Pong Health Probe

A simple round-trip probe used to verify connectivity between services.

```mermaid
sequenceDiagram
    participant Caller as Health Probe Caller
    participant PingQ as ping-queue (external)
    participant Functions as Datahub.Functions
    participant PongQ as pong-queue

    Caller->>PingQ: Ping message
    PingQ->>Functions: Queue trigger
    Functions->>PongQ: Pong response
    PongQ->>Caller: Consumed by caller
```

---

## Full Queue Topology

The diagram below shows every queue and its connections at a glance.

```mermaid
flowchart LR
    subgraph Publishers
        Portal["Portal"]
        Scheduler["Schedulers\n(timer triggers)"]
        ADOPipeline["Azure DevOps\nTerraform Pipeline"]
        ScanPipeline["Virus Scan Pipeline"]
        PyRP["ResourceProvisioner\n_PyFunctions"]
        HTTP["HTTP Trigger"]
    end

    subgraph Queues
        BRQ([bug-report])
        ENQ([email-notification])
        IHCQ([infrastructure-health-check])
        HCRQ([infrastructure-health-check-results])
        PCQ([project-capacity-update])
        PINQ([project-inactivity-notification])
        PRDQ([project-inactive])
        PUNQ([project-usage-notification])
        PUQ([project-usage-update])
        UINQ([user-inactivity-notification])
        TOQ([terraform-output-handler])
        WASCQ([workspace-app-service-configuration])
        VSNQ([virus-scan-notification])
        VSSQ([virus-scan-user-status])
        DSQ([databricks-sync-output])
        KSQ([keyvault-sync-output])
        SSQ([storage-sync-output])
        RRQ([resource-run-request])
        URQ([user-run-request])
        PongQ([pong-queue])
    end

    subgraph Consumers["Datahub.Functions / ResourceProvisioner"]
        BR["BugReport"]
        EH["EmailNotificationHandler"]
        CHK["CheckInfrastructureStatusQueue"]
        REC["RecordInfrastructureStatusQueue"]
        PCH["Portal Infra Services"]
        PIN["ProjectInactivityNotifier"]
        PRD["ProjectInactiveHandler"]
        PUN["ProjectUsageNotifier"]
        PUU["ProjectUsageUpdater"]
        UIN["UserInactivityNotifier"]
        TOH["TerraformOutputHandler"]
        WASC["ConfigureWorkspaceAppService"]
        VSN["VirusScanNotificationHandler"]
        VSS["VirusScanUserStatusHandler"]
        RPF["ResourceProvisioner\n.Functions"]
        PyRPSync["ResourceProvisioner\n_PyFunctions (sync)"]
    end

    Portal --> BRQ --> BR
    PyRP --> BRQ

    Portal --> ENQ
    Scheduler --> ENQ
    BR --> ENQ
    PIN --> ENQ
    PUN --> ENQ
    UIN --> ENQ
    ENQ --> EH

    HTTP --> IHCQ
    Scheduler --> IHCQ
    IHCQ --> CHK --> HCRQ
    PyRP --> HCRQ
    HCRQ --> REC

    TOH --> PCQ --> PCH

    Scheduler --> PINQ --> PIN --> PRDQ --> PRD

    PUU --> PUNQ --> PUN

    Scheduler --> PUQ --> PUU

    Scheduler --> UINQ --> UIN

    ADOPipeline --> TOQ --> TOH

    Portal --> WASCQ --> WASC

    ScanPipeline --> VSNQ --> VSN
    ScanPipeline --> VSSQ --> VSS

    PyRP --> DSQ --> TOH
    PyRP --> KSQ --> TOH
    Portal --> KSQ
    PyRP --> SSQ --> TOH
    Portal --> SSQ

    Portal --> RRQ --> RPF

    Portal --> URQ --> PyRPSync
    PyRPSync --> DSQ
    PyRPSync --> KSQ
    PyRPSync --> SSQ
    PyRPSync --> HCRQ

    PongQ
```

> This document was developed with the assistance of generative AI tools to support drafting, diagram generation and structuring activities. No Protected B or sensitive Government of Canada information was entered into these tools. All content has been reviewed, validated, and approved by the author to ensure accuracy, completeness, and compliance with Government of Canada security policies, standards, and applicable Treasury Board guidance.
