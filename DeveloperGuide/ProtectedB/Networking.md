# Overview

The PBMM workspaces in FSDH share a set of Azure subscriptions. Each subscription has a VNet used by multiple workspaces. Although VNet is shared among workspaces, NSG are in place to ensure subnets are isolated to deny traffic crossing workspace while allowing HTTPS traffic within a workspace.

The network layout follows this structure: tenant -> VNet -> subnets <- workspaces. A single workspace is mapped to 8 subnets, and all 8 subnets for that workspace use the same group number.

## Sample

```mermaid
flowchart TB
    subgraph Azure["Azure Subscription for PBMM Workspaces"]
        subgraph VNet["VNet: workspace-vnet (10.0.0.0/16)"]

            subgraph SN1["Subnet: APP Subnet\n10.0.1.80/28"]
                APP["Client App"]
            end

            subgraph SN2["Subnet: CAE Subnet\n10.0.1.0/26"]
                ACA["Azure Container App Jobs"]
            end

            subgraph SN3["Subnet: Private Endpoint Subnet\n10.0.1.64/28"]
                PEPBLOB["Storage Account"]
                PEPKV["Key Vault"]
                PEPAUTH["Databricks Auth"]
                PEPAPI["Databricks API"]
            end

            subgraph SN4["Subnet: PostgreSQL Subnet\n10.0.1.96/28"]
                PSQL["Postgresql"]
            end

            subgraph SN5["Subnet: Databricks Public Subnet\n10.0.1.192/27"]
                DBRPUB["Databricks Public Subnet"]
            end

            subgraph SN6["Subnet: Databricks Private Subnet\n10.0.1.160/27"]
                DBRPRV["Databricks Private Subnet"]
            end

            subgraph SN7["Subnet: Place Holder 1\n10.0.1.112/28"]
            end

            subgraph SN8["Subnet: Place Holder 2\n10.0.1.128/28"]
            end

        end
    end

    %% Traffic flow
    APP --> PEPKV
    APP --> PEPBLOB
    ACA --> PEPKV
    PSQL --> PEPKV
    APP --> PSQL
    DBRPRV --> PEPBLOB
    DBRPUB --> PEPBLOB


```

## Proposed Data Model

In the portal model, the workspace is represented by `Datahub_Project` and the Azure subscription is represented by `DatahubAzureSubscription`, which already includes `TenantId`. The proposed extension is to add VNet and Subnet entities, then link subnets to workspaces. This keeps the hierarchy explicit through the existing subscription model: a subscription carries the tenant identifier, a VNet belongs to a subscription, a VNet owns subnets, and a workspace is associated with subnets that all share the same group number.

```mermaid
classDiagram
    class DatahubAzureSubscription {
        +int Id
        +string TenantId
        +string SubscriptionId
        +string SubscriptionName
        +string Nickname
    }

    class VNet {
        +string vnet_id
        +string vnet_name
    }

    class Subnet {
        +int subnet_id
    }

    class Datahub_Project["Datahub_Project (Workspace)"] {
        +string Project_Acronym_CD
        +string Project_Name
    }

    class WorkspaceSubnet

    DatahubAzureSubscription "1" --> "0..*" Datahub_Project : has workspaces
    DatahubAzureSubscription "1" --> "0..*" VNet : contains
    VNet "1" --> "0..*" Subnet : contains
    Datahub_Project "1" --> "8" WorkspaceSubnet : uses
    Subnet "1" --> "0..*" WorkspaceSubnet : maps to
```

The class diagram hides relational properties such as foreign keys because those associations would be managed by EF Core.

In this model, the subnet group identifies the set of 8 subnets assigned to a `Datahub_Project`. For example, subnet group `1` would follow naming such as `GcDcCNR-SSC_FSDHWorkspace-vnet/GcDcCNR-SSC_FSDHWorkspace_PEP-1-snet`.
