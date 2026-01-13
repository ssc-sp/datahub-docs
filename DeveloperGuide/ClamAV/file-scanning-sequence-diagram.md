# File Scanning Sequence Diagram

This diagram illustrates the file upload and scanning flow between Core and Client environments.

```mermaid
sequenceDiagram
    participant Portal as FSDH Web Portal
    participant ScanStorage as Shared<br/> Storage Account Container
    participant EventGrid as Shared<br/>Storage Account Event Grid
    participant Queue as Shared<br/>Storage Account Queue
    participant ClientTable as Workspace<br/> Storage Account Table
    participant WorkspaceStorage as Workspace<br/>Storage Account Container
    participant ClamAV as ClamAV App
    participant ScanFunc as Scan Service<br/>Azure Function
    participant Database as FSDH Database

    Note over Portal: Core Web Environment
    Note over ScanStorage,WorkspaceStorage: Client Environment
    Note over ClamAV,Database: Core Environment
    
    Portal->>ScanStorage: Upload file to client environment
    Portal->>ClientTable: Add record (status: 'unscanned')
    
    ScanStorage->>ScanStorage: File written to dedicated<br/>scanning storage account
    
    ScanStorage->>ClamAV: New file detected
    ClamAV->>ClamAV: Scan file
    ClamAV->>ScanStorage: Update blob metadata<br/>with scan result
    
    ScanStorage->>EventGrid: Emit metadata update event
    EventGrid->>Queue: Push event to queue
    
    Queue->>ScanFunc: Trigger function<br/>(queue trigger)
    
    alt Scan result: Clean
        ScanFunc->>WorkspaceStorage: Copy blob to workspace storage
        WorkspaceStorage-->>ScanFunc: Copy successful
        ScanFunc->>ScanStorage: Delete blob from scanning storage
        ScanFunc->>ClientTable: Update status to 'ok'
    else Scan result: Infected
        ScanFunc->>ScanStorage: Delete blob from scanning storage
        ScanFunc->>ClientTable: Update status to 'infected'
        ScanFunc->>Database: Set external user expiry to current datetime
    else Scan result: Error
        ScanFunc->>ScanStorage: Delete blob from scanning storage
        ScanFunc->>ClientTable: Update status to 'error'
    end
```

## Flow Summary

### 1. File Upload
- User uploads a file through the Core Web Portal
- Portal sends the upload to the Client environment
- Record added to Client Storage Table with status 'unscanned'

### 2. File Scanning
- File is written to the Client Shared Storage Account (dedicated for scanning)
- Core ClamAV detects and scans the new file
- Scan result is written to blob metadata

### 3. Event Processing
- Metadata update emits an Event Grid event
- Event Grid pushes the event to Storage Queue (scan-results)
- Core Scan Service Function is triggered via queue trigger

### 4. Result Handling

**Clean Files:**
- Core service copies blob to Client Workspace Storage
- Source blob deleted from scanning storage
- Client Storage Table updated with status 'ok'

**Infected Files:**
- Blob deleted from scanning storage
- Client Storage Table updated with status 'infected'
- External user expiry set to current datetime

**Error Cases:**
- Blob deleted from scanning storage
- Client Storage Table updated with status 'error'
```
