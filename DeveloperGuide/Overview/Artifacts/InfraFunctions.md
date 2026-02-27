# Datahub.Functions – Azure Functions Overview

This document summarizes the purpose and triggers of the Azure Functions defined in the `Datahub.Functions` project.

> Note: Function names below refer to the `[Function("...")]` attribute used by Azure Functions and to the main responsibility of each function class.

## EmailNotificationHandler

**File:** `EmailNotificationHandler.cs`  
**Triggers:** Service Bus queue / topic trigger(s)  
**Purpose:**  
Handles incoming alert / notification messages (for example, project or infrastructure alerts) and sends email notifications via the configured `IEmailService` and GC Notify. It may also log / persist alert records using `IAlertRecordService` for later analysis and auditing.

## ProjectInactivityNotifier

**File:** `ProjectInactivityNotifier.cs`  
**Triggers:** Timer trigger  
**Purpose:**  
Periodically scans projects/workspaces to detect inactivity (e.g., based on last activity or cost signals) and creates notifications or queue messages for follow‑up processing. It coordinates with project/inactivity services to determine which workspaces are inactive.

## ProjectInactiveHandler

**File:** `ProjectInactiveHandler.cs`  
**Triggers:** Service Bus queue trigger  
**Purpose:**  
Consumes “project inactive” messages produced by schedulers / notifiers and performs follow‑up actions, such as updating database flags, sending user emails, or creating tickets. It is responsible for executing the policy once a project is considered inactive.

## InactivityScheduler

**File:** `InactivityScheduler.cs`  
**Triggers:** Timer trigger  
**Purpose:**  
Kicks off periodic checks related to user and/or project inactivity. Typically runs once per day or at a configured CRON interval, and pushes work to queues where other functions (e.g., `ProjectInactivityNotifier`, `UserInactivityNotifier`) process detailed logic.

## UserInactivityNotifier

**File:** `UserInactivityNotifier.cs`  
**Triggers:** Timer trigger or queue trigger  
**Purpose:**  
Identifies inactive users (for example, users who have not accessed Datahub workspaces for a configurable period) and sends warning or reminder emails through GC Notify or the email service. May also record these events for later reporting.

## ProjectUsageScheduler

**File:** `ProjectUsageScheduler.cs`  
**Triggers:** Timer trigger  
**Purpose:**  
Schedules data‑collection for workspace / project usage metrics. It doesn’t update usage itself, but enqueues work (e.g., to Service Bus) for downstream processors such as `ProjectUsageUpdater` and `ProjectUsageNotifier`.

## ProjectUsageUpdater

**File:** `ProjectUsageUpdater.cs`  
**Triggers:** Service Bus queue trigger  
**Purpose:**  
Processes project-usage update messages. Reads the usage payload, validates it (with `ProjectUsageUpdateMessageValidator`), and updates the `DatahubProjectDBContext` with new cost, storage, or other usage metrics.

## ProjectUsageNotifier

**File:** `ProjectUsageNotifier.cs`  
**Triggers:** Timer or queue trigger  
**Purpose:**  
Looks at up‑to‑date usage information and generates notifications – for example, when projects are close to or over budget, or when thresholds are hit. Sends notifications using `IEmailService` / GC Notify and records alert metadata where needed.

## TerraformOutputHandler

**File:** `TerraformOutputHandler.cs`  
**Triggers:** Service Bus queue trigger  
**Purpose:**  
Consumes Terraform provisioning output messages (e.g., from the ResourceProvisioner). Parses workspace definition and Terraform outputs, then updates project records, resource metadata, and/or downstream systems to reflect the newly provisioned infrastructure.

## ConfigureWorkspaceAppService

**File:** `ConfigureWorkspaceAppService.cs`  
**Triggers:** Service Bus queue trigger or HTTP trigger  
**Purpose:**  
Configures or reconfigures the Azure App Service associated with a Datahub workspace (web application). Uses `IWorkspaceWebAppManagementService` and project metadata to adjust app settings, connection strings, or scale configuration based on queued requests.

## CheckInfrastructureStatus

**File:** `CheckInfrastructureStatus.cs`  

### CheckInfrastructureScheduled

**Attribute:** `[Function("CheckInfrastructureScheduled")]`  
**Trigger:** `TimerTrigger("%ProjectUsageCRON%")`  
**Purpose:**  
On a schedule, runs infrastructure health checks for all configured resources (using `HealthCheckHelper.RunAllChecks`). Returns the aggregated results as an `OkObjectResult` and is typically used as a background/system health routine.

### CheckInfrastructureStatusHttp

**Attribute:** `[Function("CheckInfrastructureStatusHttp")]`  
**Trigger:** HTTP (`get`, `post`)  
**Purpose:**  
Exposes an HTTP endpoint to run a targeted infrastructure health check. It expects an `InfrastructureHealthCheckMessage` payload in the request body and uses `HealthCheckHelper.ProcessHealthCheckRequest` to execute only the requested tests.

### CheckInfrastructureStatusQueue

**Attribute:** `[Function("CheckInfrastructureStatusQueue")]`  
**Trigger:** Service Bus queue (`QueueConstants.InfrastructureHealthCheckQueueName`)  
**Purpose:**  
Consumes messages requesting infrastructure health checks from a Service Bus queue. Deserializes an `InfrastructureHealthCheckMessage`, runs the requested checks, and returns the results. Used for asynchronous, queued health‑check requests.

### Shared processing

All three variants (`Scheduled`, `Http`, `Queue`) delegate to:

- `HealthCheckHelper.ProcessHealthCheckRequest` – runs the actual health checks.
- `HealthCheckHelper.CreateBugReportMessage` / `SendBugReportMessagesToQueue` – when checks fail, constructs and sends bug/incident messages to a queue for follow‑up (e.g., Azure DevOps pipeline / work item integration).

## How This Fits Together

- **Schedulers** (`ProjectUsageScheduler`, `InactivityScheduler`, `DocumentationRankUpdate`, `CheckInfrastructureScheduled`) run on CRON‑based **Timer** triggers and enqueue or directly perform background work.
- **Workers** (`ProjectUsageUpdater`, `ProjectUsageNotifier`, `TerraformOutputHandler`, `ProjectInactiveHandler`, `RecordInfrastructureStatus`, `CheckInfrastructureStatusQueue`, `EmailNotificationHandler`) usually run on **Service Bus queue** triggers.
- **APIs / Hooks** (`GetUsersStatus`, `CreateGraphUser`, `BugReport`, `FunctionsHealthCheck`, `CheckInfrastructureStatusHttp`) expose **HTTP** endpoints used by the Datahub portal, tools, or monitoring systems.

All functions share common infrastructure:

- `Program.cs` wires up configuration, DI, EF Core contexts, Azure clients, and helper services.
- Shared configuration is pulled from `appsettings.json`, `local.settings.json`, user secrets, and environment variables.
- Data access and business logic are centralized in the `Datahub.*` libraries and injected into functions as needed.
