CREATE VIEW dbo.vAccounts AS
SELECT *
FROM OPENROWSET(
    BULK 'https://crmstorageaccountyt.blob.core.windows.net/transformed-data/accounts/part-00000-tid-5522267096791647772-c04732ca-ec50-4fc4-bf6b-cdc03aedc90f-29-1-c000.csv',
    FORMAT = 'CSV',
    PARSER_VERSION ='2.0',
    HEADER_ROW= TRUE

) AS rows;

SELECT *
FROM dbo.vAccounts;

CREATE VIEW dbo.vData_dictionary AS
SELECT *
FROM OPENROWSET(
    BULK 'https://crmstorageaccountyt.blob.core.windows.net/transformed-data/data_dictionary/part-00000-tid-7876722455050335794-3735f9d6-4a26-461c-a11a-61754c245224-30-1-c000.csv',
    FORMAT = 'CSV',
    PARSER_VERSION ='2.0',
    HEADER_ROW= TRUE,
    FIELDTERMINATOR = ',',
    FIELDQUOTE =''

) AS rows;

CREATE VIEW dbo.vProducts AS
SELECT *
FROM OPENROWSET(
    BULK 'https://crmstorageaccountyt.blob.core.windows.net/transformed-data/products/part-00000-tid-4757937105905497572-7a17a267-09f9-4228-aea3-ef0a1f838cc0-31-1-c000.csv',
    FORMAT = 'CSV',
    PARSER_VERSION ='2.0',
    HEADER_ROW= TRUE,
    FIELDTERMINATOR = ',',
    FIELDQUOTE =''

) AS rows;

CREATE VIEW dbo.vSales_pipeline AS
SELECT *
FROM OPENROWSET(
    BULK 'https://crmstorageaccountyt.blob.core.windows.net/transformed-data/sales_pipeline/part-00000-tid-7706073076909569940-5a68a913-ab65-4289-9cd4-35f746ba913f-32-1-c000.csv',
    FORMAT = 'CSV',
    PARSER_VERSION ='2.0',
    HEADER_ROW= TRUE,
    FIELDTERMINATOR = ',',
    FIELDQUOTE =''

) AS rows;

CREATE VIEW dbo.vSales_teams AS
SELECT *
FROM OPENROWSET(
    BULK 'https://crmstorageaccountyt.blob.core.windows.net/transformed-data/sales_teams/part-00000-tid-1732241077152127787-21c2b43c-88f4-49de-90b7-a231cc18d382-33-1-c000.csv',
    FORMAT = 'CSV',
    PARSER_VERSION ='2.0',
    HEADER_ROW= TRUE,
    FIELDTERMINATOR = ',',
    FIELDQUOTE =''

) AS rows;






SELECT * FROM dbo.vSales_pipeline;

SELECT sales_agent, close_value
FROM dbo.vSales_pipeline
WHERE
close_value>2000
ORDER BY close_value DESC;


SELECT product, close_value 
FROM dbo.vSales_pipeline
ORDER BY close_value DESC;