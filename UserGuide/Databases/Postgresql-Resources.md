---
onProfileExclude: ssc
---

# Postgresql Azure

## Authentication model

Datahub only supports the managed instances of Postgresql deployed in Azure. To authenticate to the database, it is necessary to follow the Azure model which requires a token.

## Supported tools

- [pgAdmin](https://www.pgadmin.org/)

## Quick start instructions

### Initial setup
1. Download and install pgAdmin
2. Create a new server
   - right-click on the **Servers** item in the Browser tab
   - from the context menu, select **Create** -> **Server**
3. In the Create Server dialog box, open the **Connection** tab and enter the **Database Hostname** and **Database Username** shown above in the **Host name/address** and **Username** textboxes, respectively
   - Note: **Do not** enter any password at this time
4. In the SSL tab, set the **SSL mode** to **Require**
5. Save the server you have set up

### Connecting to the database
1. Obtain an access token using one of the following methods:
    #### Using the Datahub Portal
      1. Click the Generate Token button above.
      1. Click the copy button to copy the token to your clipboard.
    #### Using the Azure command-line interface in PowerShell or CMD
      1. Enter `az login`. This will bring up a browser window to confirm the user name. You may be required to re-login.
      1. Enter `az account get-access-token --resource-type oss-rdbms`. This will return a JSON object:  
         ```
         {
           "accessToken": "[a long character string]",
           "expiresOn": "[date and time]",
           "subscription": "...",
           "tenant": "...",
           "tokenType": "Bearer"
         }
         ```
      1. Select and copy the contents of the `accessToken` property.
1. In pgAdmin, right-click on your previously created server and select **Connect Server**
   - you may also double-click on the server to connect to it
1. It should popup a dialog box asking for your password - paste the access token there
   - Note: **Do not** check the "Save Password" checkbox, as your access token will expire after a certain time and you will need a fresh one to connect
1. Click **Ok** to connect to the server
