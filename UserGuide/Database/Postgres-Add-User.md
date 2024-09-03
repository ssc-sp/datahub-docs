# Add a User to PostgreSQL on FSDH

As a workspace lead, you must create a user account for each user who needs access to the PostgreSQL database on the Federal Science DataHub (FSDH). This guide will walk you through the steps to add a user to the PostgreSQL database on FSDH.

## Option A. Using an SQL Query

1. Connect to the PostgreSQL database using a tool like `psql`, Python, or any other SQL client.

2. Run the following SQL query to create a new user:

```sql
CREATE USER <username> WITH PASSWORD '<password>';
```

Replace `<username>` with the desired username and `<password>` with the desired password for the new user.

3. Grant the necessary permissions to the new user. For example, to grant all privileges on a specific database, run the following SQL query:

```sql
GRANT ALL PRIVILEGES ON DATABASE <database_name> TO <username>;
```

Replace `<database_name>` with the name of the database you want to grant access to.

4. Validate that the user has been created successfully by checking the list of users in the PostgreSQL database.

## Option B. Using pgAdmin

1. Open pgAdmin and connect to the PostgreSQL database.

2. Right-click on the `Login/Group Roles` node and select `Create` > `Login/Group Role`.

3. In the `General` tab, enter the desired username in the `Name` field.

![Preview 1](/api/docs/UserGuide/Database/create-user-1.png)

4. In the `Definition` tab, enter the desired password in the `Password` field.

5. In the `Role Privileges` tab, grant the necessary privileges to the new user.

6. Click `Save` to create the new user.

7. Validate that the user has been created successfully by checking the list of users in the PostgreSQL database.