---
onProfileInclude: nrcan
---

# Welcome

Thanks for signing up to the Shared Services Canada DataHub.

## Proof-of-Concept Evaluation

You will be provided PoC evaluation online forms at sprint intervals and asked to complete the evaluation by the date provided by the Data Solutions team.

## Access/Sign-in
You must have been onboarded to the environment by the SSC team before you can access the DataHub. If you have not been advised that you are onboarded, please contact the [Data Solutions team](mailto:datasolutions-solutiondedonnees@ssc-spc.gc.ca) for further details.

See **[Sign-in Instructions](https://github.com/ssc-sp/datahub-portal/wiki/Sign-in-Instructions)** for detailed instructions on accessing the SSC DataHub.

## DataHub Landing Page
 
Start at the SSC Datahub Landing Page: https://datahub-test.scienceprogram.cloud/

![image](https://user-images.githubusercontent.com/99416857/153502021-85037044-830b-424c-b4a7-761b602fbe31.png)

**Landing Page Description**

![image](https://user-images.githubusercontent.com/99416857/153505232-4f489ef1-6a13-4c2a-9879-a6c5363cbb0f.png)


# Workflow and Capabilities

## 1. Find your Data Projects and tools
* Select My Projects from the Home page to find the project(s) that have been configured for you.
![image](https://user-images.githubusercontent.com/99416857/153502246-f724f3b7-e2e8-4a4e-b5af-2e4b7a6e2cee.png)

If you do not have access to the project you have been assigned, click on the **Request Access **button and your request will be reviewed and you will be notified when access is granted.

**Review Project Toolset**

* **Project Storage**: Access the storage account for this project to upload, download and share datasets with all project members. (An Azure Storage Account is assigned to the project by the DataHub admin team).
* **Azure Databricks**:  Run your Python, R and SQL notebooks in the cloud with Databricks for analytics, machine learning and data pipelines. (

## 2. Store and Share data

### Upload and Download data:
 **Project Storage: Storage Explorer**
 Two options are available for upload/download.
*  **Drag and drop interface** is accessible at the top of the Storage Explorer page. The tool enables users to upload and download files.
 See menu items for available functions
![image](https://user-images.githubusercontent.com/99416857/153503195-fb5e9a51-1ac1-44db-b7d1-9aeef71017f4.png)

* **AzCopy** (command line): is the recommended option for working with large files and the tool can also be integrated into scripts.
  * You will also need AzCopy Access in order to upload/download files with this method.
  * Shared Access Signature (SAS) Token is a “secure way to grant limited access to the resources in your storage account.” If you navigate away from the page once you generate a Token, unless you have saved the token you will need to repeat the action.The system provides a 14 day token, you can request an extended period SAS Token from the Data Solutions team. 
  * Refer to the Storage Explorer section “**Use AzCopy to Interact with Azure Storage Account**” for details on using AzCopy. The [DataHub Video Tutorial - AzCopy focus](https://dhdemosand.blob.core.windows.net/datahub/Data%20Sharing%20Tutorial.mp4?sv=2020-10-02&st=2022-02-09T20%3A22%3A12Z&se=2023-02-10T20%3A22%3A00Z&sr=b&sp=r&sig=OeNPrxbhVMshileL39VKre%2FQBBYfUae5gz1M%2Fsyo3JY%3D) also provides detailed instructions on setting up and using AzCopy. 

### Databases:
  * If your project is granted database tools please contact the Data Solutions team as instructions will be database dependent.

### Share data: 
Collaborators must have a DataHub account and be assigned access to your project. To request an account for your collaborators send an email to the [Data Solutions mailbox](mailto:datasolutions-solutiondedonnees@ssc-spc.gc.ca).
 

## **3. Notebook (Databricks)**
* Feature to be enabled later in Proof-of-Concept
## **4. Estimate Costs**
Feature to be enabled later in P* roof-of-Concept

# Rules

## Terms and Conditions
_(Link)_

## Metadata
* Metadata Profile not yet enabled – TBD.
 

# Roles
![image](https://user-images.githubusercontent.com/99416857/153506295-b6fa92f2-0dc3-4859-8c95-7e6868f09c95.png)


# Support
If you have any issues using the SSC DataHub please contact [Data Solutions mailbox](mailto:datasolutions-solutiondedonnees@ssc-spc.gc.ca) and one of our team members will contact you asap.

 

# Frequently Asked Questions
 
**1. What is the purpose and scope of this Proof-of-Concept?**
To prove the concept of a cloud environment for storing and sharing GC science data that reduces barriers to collaboration by integrating cloud capabilities into existing local science applications (per use case)
To begin evaluation of current capabilities of the SSC Data Hub proof-of-concept with SBDA use cases and identify additional  activities, use cases, capabilities / features for next sprints and or PoCs.

**2. What are the capabilities to be assessed?** Cloud storage, Sharing, Notebook collaboration 

**3. Where does the data ‘live’?**
SSC’s Azure Cloud – hosted in Canada. 

**4. What will happen to the data at the end of the PoC?**
Options are destroy or migrate to another environment specified by user. 

**5. What is an Azure storage account?**
There are two key types of storage accounts – these are enabled by SSC and access provided by the DataHub team:
* Azure Blob Storage - basic storage account - doesn't provide Access Control at the file and folder level but is required for compatibility in certain scenarios.
* Azure Data Lake Storage (Gen2) - designed for big data analytics and provides Access Control Lists at the file and folder level

**6. Can I have more than one Storage Explorer?**
Yes, this will be available in future sprints. It will allow you to keep some data internal to your team and shar some data.

**7. What if I need to more than the 10TB allocation?**
For the PoC we are trying to limit file sizes. However, if you need more storage, please send an email to the Data Solutions mailbox and your request will be reviewed.

**8. Will I have issues using the DataHub with VPN?**
You may need to disconnect from your VPN to upload or download files.
Additionally, it is recommended to run AzCopy through remote desktop for faster upload, as VPN will be slow.

**9. Will the file upload to my personal account or will it go directly in the Data project?**
Assuming you are in the “Project Storage” it will go in the project storage.  

**10. The system is telling me that it will take 3-7 hours to upload the file. Is that normal for the size and using the drag and drop option?**
We do not recommend using the web upload – because it goes through several layers to reach the storage. Also a slow speed there can be difficult to diagnose. Please use AzCopy -- we've created a video for this: [DataHub Video Tutorial - AzCopy focus](https://dhdemosand.blob.core.windows.net/datahub/Data%20Sharing%20Tutorial.mp4?sv=2020-10-02&st=2022-02-09T20%3A22%3A12Z&se=2023-02-10T20%3A22%3A00Z&sr=b&sp=r&sig=OeNPrxbhVMshileL39VKre%2FQBBYfUae5gz1M%2Fsyo3JY%3D)



***
