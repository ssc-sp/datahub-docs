# Hosting Shiny App with FSDH

FSDH can host your interactive Shiny apps that require long running hours and serve a wider range of users; 

- Azure App Service is used for hosting your Shiny apps that run as a Docker container. The cost is typically < $100 a month;
- You do not need to know Docker. However, if you have already docerized your Shiny app, FSDH can also host it. Pleae contact FSDH support for this option.
- FSDH provides authentication for your Shiny app without any code change. However, you can still control user permissions inside your Shiny app code;

# Criteria

- Your Shiny app only accesses files in your Azure Storage Account instead of other data sources such as database;
- Your Shiny app requires less than 8GB of memory to run;
- Your Shiny app only open to registered FSDH users;

# Develop Shiny App

You can develop and test your Shiny app code locally. To access your FSDH storage, login and generate an SAS token in FSDH. When deployed, your Shiny code has access to the following environment variables:

|Environment Variable Name| Type | Description |
| --- | --- | --------- |
|BLOB_ACCOUNT_NAME|string|Your FSDH storage account name (e.g. mysuperproject)|
|BLOB_ACCOUNT_KEY|string|The access key for your FSDH storage account|
|BLOB_CONTAINER_NAME|string|The blob container used by FSDH (typically "`datahub`")|
|BLOB_ACCOUNT_URL|string|The base URL for your FSDH storage and can be used in your code e.g. https://mysuperproject.blob.core.windows.net) without container or folder|
|BLOB_SAS_TOKEN|string|The SAS token can be used to initialize an Azure Blob API client (e.g. `sv=2012-02-12&st=2009-02-09&se=2009-02-10&sr=c&sp=r&si=YWJjZGVmZw%3d%3d&sig=dD80ihBh5jfNpymO5Hg1IdiJIEvHcJpCMiCMnN%2fRnbI%3d`)|

The following R code snippet illustrates how Shiny app connects to FSDH storage accounts and read a file:

```
# Get Azure Storage Account details
storage_account_name <- Sys.getenv("BLOB_ACCOUNT_NAME")
storage_account_key <- Sys.getenv("BLOB_ACCOUNT_KEY")
container_name <- Sys.getenv("BLOB_CONTAINER_NAME")

# Read the CSV file from Azure Blob Storage
bl_endp_key <- storage_endpoint(paste("https://", storage_account_name, ".blob.core.windows.net", sep = ""), key=storage_account_key)
cont <- storage_container(bl_endp_key, "datahub")
data <- storage_read_csv(cont, "myfile.csv")
```

# Deploy Shiny App

Once your Shiny app is ready to deploy, you can deploy by simply copying the files to your FSDH storage account under the folder `shiny`. (The folder name can be configured). The system will run `app.R` file at launch.

# Access Shiny App
Once deployed, your Shiny app will be accessible at https://federal-science-datahub.canada.ca/home