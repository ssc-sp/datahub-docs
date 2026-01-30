# Overview

The PBMM workspaces in FSDH share a set of Azure subscriptions. Each subscription has a VNet used by multiple workspaces. Although VNet is shared among workspaces, NSG are in place to ensure subnets are isolated to deny traffic crossing workspace while allowing HTTPS traffic within a workspace.

# Diagram

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
