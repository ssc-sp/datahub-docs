# File Scanning Sequence Diagram

This diagram illustrates the file upload and scanning flow between Core and Client environments.

```mermaid
sequenceDiagram
    participant Portal as FSDH Web Portal
    participant TriageStorage as Workspace<br/>Triage Container
    participant EventGrid as Workspace<br/>Storage Account Event Grid
    participant ClientTable as Workspace<br/> Storage Account Table
    participant WorkspaceStorage as Workspace<br/>Storage Account Container
    participant ServiceBus as Service Bus
    participant ClamAV as ClamAV App
    participant ScanFunc as Scan Service<br/>Azure Function
    participant Database as FSDH Database

    Note over Portal: Core Web Environment
    Note over TriageStorage,WorkspaceStorage: Client Environment
    Note over ServiceBus,ClamAV,Database: Core Environment
    
    Portal->>TriageStorage: Upload file to client environment
    Portal->>ClientTable: Add record (status: 'unscanned')
    
    TriageStorage->>TriageStorage: File written to workspace<br/>triage container
    
    TriageStorage->>ClamAV: New file detected
    ClamAV->>ClamAV: Scan file
    ClamAV->>TriageStorage: Update blob metadata<br/>with scan result
    
    TriageStorage->>EventGrid: Emit metadata update event
    EventGrid->>ServiceBus: Push event to service bus
    
    ServiceBus->>ScanFunc: Trigger function<br/>(service bus trigger)
    
    alt Scan result: Clean
        ScanFunc->>WorkspaceStorage: Copy blob to workspace storage
        WorkspaceStorage-->>ScanFunc: Copy successful
        ScanFunc->>TriageStorage: Delete blob from triage container
        ScanFunc->>ClientTable: Update status to 'ok'
    else Scan result: Infected
        ScanFunc->>TriageStorage: Delete blob from triage container
        ScanFunc->>ClientTable: Update status to 'infected'
        ScanFunc->>Database: Set external user expiry to current datetime
    else Scan result: Error
        ScanFunc->>TriageStorage: Delete blob from triage container
        ScanFunc->>ClientTable: Update status to 'error'
    end
```

## Flow Summary

### 1. File Upload
- User uploads a file through the Core Web Portal
- Portal sends the upload to the Client environment
- Record added to Client Storage Table with status 'unscanned'

### 2. File Scanning
- File is written to the Workspace Triage Container
- Core ClamAV detects and scans the new file
- Scan result is written to blob metadata

### 3. Event Processing
- Metadata update emits an Event Grid event
- Event Grid pushes the event to Service Bus
- Core Scan Service Function is triggered via service bus trigger

### 4. Result Handling

**Clean Files:**
- Core service copies blob to Client Workspace Storage
- Source blob deleted from triage container
- Client Storage Table updated with status 'ok'

**Infected Files:**
- Blob deleted from triage container
- Client Storage Table updated with status 'infected'
- External user expiry set to current datetime

**Error Cases:**
- Blob deleted from triage container
- Client Storage Table updated with status 'error'
```
