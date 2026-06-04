============================================================
File Name     : 03_create_customer_staging_table.sql
Table Name    : Customer_Staging
Purpose       : Raw data ingestion layer
============================================================
*/

CREATE TABLE dbo.Customer_Staging
(
    Staging_ID INT IDENTITY(1,1) PRIMARY KEY,

    Customer_ID      VARCHAR(50),
    First_Name       VARCHAR(100),
    Last_Name        VARCHAR(100),
    Email            VARCHAR(255),
    Phone_Number     VARCHAR(20),
    Date_of_Birth    DATE,

    City             VARCHAR(100),
    State            VARCHAR(100),
    Country          VARCHAR(100),
    Pincode          VARCHAR(20),

    Customer_Status  VARCHAR(50),
    Customer_Type    VARCHAR(50),

    Created_Date     DATETIME2,
    Updated_Date     DATETIME2,

    Source_System    VARCHAR(100),
    Batch_ID         VARCHAR(50),

    Load_Timestamp   DATETIME2 DEFAULT SYSDATETIME()
);