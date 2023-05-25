# Federal Science Datahub Databricks Cluster Policies

## Overview

As part of the Federal Science Datahub, we provide custom Databricks cluster policies that are designed to help you get the most out of your Databricks clusters by having predefined cluster configurations. We currently offer 3 cluster policies on top of Databrick's personal compute policy. These are "Datahub Small Cluster", "Datahub Regular Cluster" and "Datahub Large Cluster". While workers and drivers configurations are predefined, the choice of [databricks runtime](https://docs.databricks.com/runtime/index.html) is completely up to you. We will go through each of these cluster policies in detail below.

### **Personal Compute**

This is the default cluster policy that is provided by Databricks. It is designed for personal use and is not recommended for production use. It is a good choice if you are just getting started with Databricks and want to get a feel for how it works. It is also a good choice if you are working with small datasets and do not need a lot of compute power. Do note that this cluster is a single-node/single-worker cluster and as such no parallelization will be done. By default, it uses the latest machine learning runtime, meaning machine learning toolings are available within this cluster. The cluster configuration is as follows:

- **Node type:** Standard_DS3_v2 (4 CPU, 14 GB memory)

[Read more here on personal compute policies](https://docs.databricks.com/clusters/personal-compute.html)

### **Datahub Small Cluster**

This cluster policy is designed for small production workloads. It is a good choice if you are working with small datasets and do not need a small amount of compute power that can scale if needed. It is also a good choice if you are just getting started with Databricks and want to get a feel for how non-personal cluster. The cluster configuration is as follows:

- **Worker and driver type:** Standard_D4ds_v5 (4 CPU, 16 GB memory)
- **Amount of workers:** 0 to 2 workers
- **Can do spot instances**
- **Can do autoscaling**

### **Datahub Regular Cluster**

This cluster policy is designed for regular production workloads. It is a good choice if you've encountered bottlenecks with the small cluster configuration. The cluster configuration is as follows:

- **Worker and driver type:** Choice of the following
  - Standard_D4ds_v5 (4 CPU, 16 GB memory)
  - Standard_D8ds_v5 (8 CPU, 32 GB memory)
  - Standard_D16ds_v5 (16 CPU, 64 GB memory)
- **Amount of workers:** 0 to 4 workers
- **Can do spot instances**
- **Can autoscale**

### **Datahub Large Cluster**

This cluster policy is designed for large production workloads. It is a good choice if you're working with extremely big data that requires maximal parallelization. It is not recommended users use this cluster unless they are aware of the possible costs it may entail. The cluster configuration is as follows:

- **Worker and driver type:** Choice of the following
  - Standard_D4ds_v5 (4 CPU, 16 GB memory)
  - Standard_D8ds_v5 (8 CPU, 32 GB memory)
  - Standard_D16ds_v5 (16 CPU, 64 GB memory)
  - Standard_D32ds_v5 (32 CPU, 128 GB memory)
  - Standard_D48ds_v5 (48 CPU, 192 GB memory)
  - Standard_D64ds_v5 (64 CPU, 256 GB memory)
- **Amount of workers:** 0 to 4 workers
- **Can do spot instances**
- **Can autoscale**

## Creating a cluster

For more information on how to create clusters, please refer to the [Databricks documentation](https://learn.microsoft.com/en-us/azure/databricks/clusters/configure).

## In the future

We are already looking at possible new cluster policies that will offer not only specific configurations but also specific toolings, such as Conda support. We will communicate with users upon the release of such new cluster policies.
