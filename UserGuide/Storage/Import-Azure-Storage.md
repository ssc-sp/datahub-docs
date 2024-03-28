# Importing an Existing Azure Storage Account

Importing your own Azure Storage account in Datahub's File Explorer interface is quite simple. You only need the account name and an access key to set it up. To get this information, use the following steps.

1. Navigate to the storage account in your Azure Portal, and select **Access keys** under the **Security + networking** section in the left menu.  
![Access keys in menu](/api/docs/UserGuide/Storage/import_azure-01.png)

2. Note the **Storage account name** - this will need to be entered into the account configuration dialog in Datahub. For the access key, you can use either of the keys. If the key being used gets rotated (i.e. a new one is generated to replace it), the setting in Datahub will need to be updated. Click on the **Show** button beside the key you wish to use.  
![Access keys page](/api/docs/UserGuide/Storage/import_azure-02.png)

3. When the key is revealed, you can use the **Copy to clipboard** button to copy the key.  
![Copy access key](/api/docs/UserGuide/Storage/import_azure-03.png)

The **Storage Account Name** and **Account Key** can now be entered into the Azure storage dialogue.  
![Azure storage dialogue](/api/docs/UserGuide/Storage/import_azure-04.png)
