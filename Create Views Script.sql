CREATE SCHEMA gold;





-- CREATE VIEW CALENDAR
CREATE OR ALTER VIEW gold.calendar AS
SELECT * 
FROM OPENROWSET(
    BULK 'https://eltstorageaccount.dfs.core.windows.net/silver/adventureworks-calendar/',
    FORMAT = 'PARQUET'
) AS quer1;
GO

-- CREATE VIEW CUSTOMERS
CREATE OR ALTER VIEW gold.customers AS
SELECT * 
FROM OPENROWSET(
    BULK 'https://eltstorageaccount.dfs.core.windows.net/silver/adventureworks-customers/',
    FORMAT = 'PARQUET'
) AS quer1;
GO

-- CREATE VIEW PRODUCTS
CREATE OR ALTER VIEW gold.products AS
SELECT * 
FROM OPENROWSET(
    BULK 'https://eltstorageaccount.dfs.core.windows.net/silver/adventureworks-products/',
    FORMAT = 'PARQUET'
) AS quer1;
GO

-- CREATE VIEW RETURNS
CREATE OR ALTER VIEW gold.returns AS
SELECT * 
FROM OPENROWSET(
    BULK 'https://eltstorageaccount.dfs.core.windows.net/silver/adventureworks-returns/',
    FORMAT = 'PARQUET'
) AS quer1;
GO

-- CREATE VIEW SALES
CREATE OR ALTER VIEW gold.sales AS
SELECT * 
FROM OPENROWSET(
    BULK 'https://eltstorageaccount.dfs.core.windows.net/silver/adventureworks-sales/',
    FORMAT = 'PARQUET'
) AS quer1;
GO

-- CREATE VIEW SUBCATEGORIES
CREATE OR ALTER VIEW gold.procat AS
SELECT * 
FROM OPENROWSET(
    BULK 'https://eltstorageaccount.dfs.core.windows.net/silver/adventureworks-product-categories/',
    FORMAT = 'PARQUET'
) AS quer1;
GO

-- CREATE VIEW TERRITORIES
CREATE OR ALTER VIEW gold.territories AS
SELECT * 
FROM OPENROWSET(
    BULK 'https://eltstorageaccount.dfs.core.windows.net/silver/adventureworks-territories/',
    FORMAT = 'PARQUET'
) AS quer1;
GO
