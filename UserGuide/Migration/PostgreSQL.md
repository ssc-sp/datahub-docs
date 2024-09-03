# PostgreSQL Migration Instructions

This document provides instructions on how to migrate your PostgreSQL databases from the proof-of-concept (POC) environment to the production (PROD) environment or to offboard your PostgreSQL databases from the POC environment.

## A. Create a Dump of Your Database

Regardless of whether you are migrating your PostgreSQL databases to the PROD environment or offboarding them from the POC environment, you should start by creating a dump of your databases. This dump will be used to either import your databases into the PROD environment or to store them for future use.

### Option 1: Create a Dump Using `pg_dump`

1. Connect to your PostgreSQL database using `psql` or a similar tool.

2. Run the following command to create a dump of your database:

```bash
pg_dump -U <username> -d <database_name> -f <dump_file_name>.sql
```

Replace `<username>` with your PostgreSQL username, `<database_name>` with the name of the database you want to dump, and `<dump_file_name>` with the name you want to give to the dump file.

3. Validate that the dump file has been created successfully by checking the file location.

### Option 2: Create a Dump Using pgAdmin

1. Open pgAdmin and connect to your PostgreSQL database.

2. Right-click on the database you want to dump and select `Backup...`.

![Preview 1](/api/docs/UserGuide/Migration/postgres-pgadmin-1.png)

3. In the `Backup Options` tab, select the format for the backup file (e.g., `Plain`).

4. In the `Filename` field, specify the location and name of the dump file.

![Preview 2](/api/docs/UserGuide/Migration/postgres-pgadmin-2.png)

5. Click `Backup` to create the dump file.

6. Validate that the dump file has been created successfully by checking the file location.

### Option 3: Create a Dump Using DBeaver

1. Open DBeaver and connect to your PostgreSQL database.

2. Right-click on the database you want to dump and select `Tools` > `Export Database`.

3. In the `Export Settings` tab, select the format for the export file (e.g., `SQL`).

4. In the `Output File` field, specify the location and name of the dump file.

5. Click `Finish` to create the dump file.

6. Validate that the dump file has been created successfully by checking the file location.

## B. Migrate PostgreSQL from POC to PROD

To migrate your PostgreSQL databases from the POC environment to the PROD environment, you can use the dump files created in the previous step to import your databases into the PROD environment.

### Option 1: Import Dump Using `psql`

1. Connect to the PROD PostgreSQL database using `psql` or a similar tool.

2. Run the following command to import the dump file into the PROD database:

```bash
psql -U <username> -d <database_name> -f <dump_file_name>.sql
```

Replace `<username>` with your PostgreSQL username, `<database_name>` with the name of the database you want to import into, and `<dump_file_name>` with the name of the dump file.

3. Validate that the import process was successful by checking the PROD database.

### Option 2: Import Dump Using pgAdmin

1. Open pgAdmin and connect to the PROD PostgreSQL database.

2. Right-click on the database you want to import into and select `Restore...`.

![Preview 3](/api/docs/UserGuide/Migration/postgres-pgadmin-3.png)

3. In the `Restore Options` tab, select the dump file you created in the previous step.

4. Click `Restore` to import the dump file into the PROD database.

![Preview 4](/api/docs/UserGuide/Migration/postgres-pgadmin-4.png)

5. Validate that the import process was successful by checking the PROD database.

### Option 3: Import Dump Using DBeaver

1. Open DBeaver and connect to the PROD PostgreSQL database.

2. Right-click on the database you want to import into and select `Tools` > `Import Database`.

3. In the `Import Settings` tab, select the format of the import file (e.g., `SQL`).

4. In the `Input File` field, select the dump file you created in the previous step.

5. Click `Finish` to import the dump file into the PROD database.

6. Validate that the import process was successful by checking the PROD database.

## C. Offboard PostgreSQL from POC

Using the dump files created in the first step, you can offboard your PostgreSQL databases from the POC environment by storing the dump files for future use or archiving them.