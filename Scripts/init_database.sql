/*
=====================================================================
Create Database and Schemas: DataWarehouse
=====================================================================

Script Purpose:
    This script creates a new SQL Server database named 'DataWarehouse'.
    - If the database already exists, it will be dropped and recreated.
    - It then creates three schemas: 'bronze', 'silver', and 'gold'.

Schema Layers:
    ▸ bronze: Raw, ingested data from source systems.
    ▸ silver: Cleaned and transformed intermediate data.
    ▸ gold: Curated, business-ready data for reporting.

⚠️ WARNING:
    Executing this script will delete the existing 'DataWarehouse' database
    and all its contents. Make sure to back up any critical data before proceeding.

=====================================================================
*/

-- Switch to the master database to allow database-level operations
USE master;
GO

-- Check if the database already exists, and if so, drop it
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    PRINT 'Database "DataWarehouse" already exists. Dropping the database...';

    -- Set the database to SINGLE_USER mode to disconnect all users
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    -- Drop the database
    DROP DATABASE DataWarehouse;

    PRINT 'Database "DataWarehouse" has been dropped.';
END;
GO

-- Create the new DataWarehouse database
CREATE DATABASE DataWarehouse;
GO

PRINT 'Database "DataWarehouse" has been created.';
GO

-- Switch context to the new DataWarehouse database
USE DataWarehouse;
GO

-- Create 'bronze' schema for raw/ingested data
CREATE SCHEMA bronze;
GO
PRINT 'Schema "bronze" created.';
GO

-- Create 'silver' schema for cleaned/transformed data
CREATE SCHEMA silver;
GO
PRINT 'Schema "silver" created.';
GO

-- Create 'gold' schema for curated/business-ready data
CREATE SCHEMA gold;
GO
PRINT 'Schema "gold" created.';
GO

/*
=====================================================================
End of Script
=====================================================================
*/
