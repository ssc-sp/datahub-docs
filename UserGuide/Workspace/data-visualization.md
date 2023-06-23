# Science Data Visualization with FSDH

The data product resulted from your scientific research can be visualized with familiar and supported tools by connecting to FSDH.

# Option 1. Shiny App

This popular option can be used to develop powerful interactive web applications entirely in R. Once developed and tested, you can deploy in two ways:

  ## Run on Azure App Service

  FSDH can easily host your Shiny app in your own Azure App Service. Running your Shiny app on Azure App Service is more cost effective as it does not require a long running Databricks cluster, which typically costs much more. With this option, you upload your code to your storage account and a containerized Shiny server automatically starts with your code. FSDH also gives you a domain (e.g. https://my-shiny-app.fsdh-dhsf.science.cloud-nuage.canada.ca). The simplist design is to have your Shiny app connect to the data files on your Azure Storage Account.

  Once deployed, your app is automatically protected with authentication without any additional coding. As a result, only registered FSDH users can visit your Shiny app. You can further secure your Shiny app to limit to a smaller list of users by writing some code in your app.R.

  ## Run inside Databricks

  Although not recommended due to higher cost, you can still host your Shiny app in your notebook and keep a smaller cluster running. This is simpler and faster to set up but Databricks imposes a hard limit of 50MB on the data size used in your Shiny app.

# Option 2. PowerBI

You can develop PowerBI reports and source data from your FSDH Databricks workspace or your FSDH Azure Storage. 

  ## Source data from FSDH storage

  Your PowerBI reports can retrieve data from your FSDH storage using an SAS token generated from within FSDH application. 

  ## Source data from FSDH Databricks

  Your PowerBI reports can also connect to your FSDH Databricks clusters. For this option, however, the clusters will be started for the data retrieval and refresh.


