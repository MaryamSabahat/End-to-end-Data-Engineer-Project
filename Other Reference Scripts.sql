-- Step 1: Create a master key for encrypting credentials in the database

CREATE MASTER KEY ENCRYPTION BY PASSWORD = '************';



-- Step 2: Create a scoped credential using Managed Identity for authentication
CREATE DATABASE SCOPED CREDENTIAL cred_p01
WITH IDENTITY = 'Managed Identity'

-- Step 3: Create an external data source pointing to the Silver container in the Data Lake
CREATE EXTERNAL DATA SOURCE source_silver
WITH 
(
    LOCATION = 'https://eltstorageaccount.dfs.core.windows.net/silver',
    CREDENTIAL= cred_p01
)



-- Step 4: Create another external data source pointing to the Gold container
CREATE EXTERNAL DATA SOURCE source_gold
WITH 
(
    LOCATION = 'https://eltstorageaccount.dfs.core.windows.net/gold',
    CREDENTIAL= cred_p01
)


-- Step 5: Define an external file format for reading Parquet files
CREATE EXTERNAL FILE FORMAT format_parquet 

WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION ='org.apache.hadoop.io.compress.GzipCodec'

)


-- Step 6: Create an external table named 'extsales' in the 'gold' schema
-- This external table reads data from Parquet files stored in the 'extsales' folder of the gold container


CREATE EXTERNAL TABLE gold.extsales
WITH
(
    LOCATION ='extsales',
    DATA_SOURCE =source_gold,
    FILE_FORMAT =format_parquet
)
AS
SELECT
*
FROM gold.sales



-- Step 7: Query the external table to view its contents
SELECT * FROM gold.extsales
