============================================================
File Name     : 05_create_customer_error_table.sql
Table Name    : Customer_Error
Purpose       : Stores invalid customer records with error details
Layer         : Error
============================================================
*/

CREATE TABLE dbo.Customer_Error
(
    -- 1. System Key
    Error_ID INT IDENTITY(1,1) PRIMARY KEY,

    -- 2. Run Tracking (Governance)
    Run_ID INT,

    -- 3. Raw Customer Data (same as staging)
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

    -- 4. Error Details
    Error_Code       VARCHAR(50),
    Error_Message    VARCHAR(255),

    -- 5. Metadata
    Load_Timestamp   DATETIME2 DEFAULT SYSDATETIME()
);