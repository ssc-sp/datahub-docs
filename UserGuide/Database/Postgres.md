# Create and use a PostgreSQL Database on FSDH

## Video

<video width="600" height="350" controls>
    <source src="/api/media/postgres.mp4" type="video/mp4">
    Your browser does not support the video tag.
</video>

The Federal Science DataHub provides the ability to provision a PostgreSQL database for your workspace. This guide will walk you through the process of creating a PostgreSQL database and using it in code.

## How to provision a PostgreSQL Database

1. Navigate to the workspace you want to create a PostgreSQL database in.
2. Navigate to the `Toolbox` tab under the `Administration` category.
![](/api/docs/UserGuide/Database/database-1.png)
3. Within a few minutes, the database will be provisioned and you will see it in the `Toolbox` tab. If the database does not provision, please fill out a support request.

## How to use your PostgreSQL Database

1. Navigate to the workspace you want to use the PostgreSQL database in.
2. Navigate to the `SQL Database` tab under the `Workspace Tools` category. This page provides you with the needed information to connect to your database.
3. **Before trying to use the database**, you must add your IP address to the firewall rules. 
    * Navigate to the bottom of the page and click `Add Current IP Address` to add your local IP address to the firewall rules.
    * If you switch networks or toggle your VPN, you will need to add your new IP address to the firewall rules.
    * To give Databricks access to the database, you will need to add the address `0.0.0.0` to the firewall rules.
    * **NOTE:** Changes can take up to 15 minutes to apply.
![](/api/docs/UserGuide/Database/database-2.png)
4. After adding your IP address to the firewall rules, you can use the connection info provided for Databricks, Python, R, Java, and C#.
![](/api/docs/UserGuide/Database/database-3.png)