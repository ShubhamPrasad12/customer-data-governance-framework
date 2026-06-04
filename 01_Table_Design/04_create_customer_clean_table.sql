============================================================
File Name     : 04_create_customer_clean_table.sql
Table Name    : Customer_Clean
Purpose       : Stores validated and trusted customer data
Layer         : Clean
============================================================
*/

CREATE TABLE dbo.Customer_Clean
(
    -- 1. Surrogate Key (System Generated)
    Customer_Key INT IDENTITY(1,1) PRIMARY KEY,

    -- 2. Run Tracking (Governance)
    Run_ID INT NOT NULL,

    -- 3. Business Key
    Customer_ID      VARCHAR(50) NOT NULL UNIQUE,

    -- 4. Customer Data
    First_Name       VARCHAR(100) NOT NULL,
    Last_Name        VARCHAR(100),
    Email            VARCHAR(255) NOT NULL,
    Phone_Number     VARCHAR(20) NOT NULL,
    Date_of_Birth    DATE,

    -- 5. Location
    City             VARCHAR(100),
    State            VARCHAR(100),
    Country          VARCHAR(100),
    Pincode          VARCHAR(20),

    -- 6. Classification
    Customer_Status  VARCHAR(50) NOT NULL,
    Customer_Type    VARCHAR(50) NOT NULL,

    -- 7. Lifecycle
    Created_Date     DATETIME2 NOT NULL,
    Updated_Date     DATETIME2,

    -- 8. Governance
    Source_System    VARCHAR(100) NOT NULL,
    Batch_ID         VARCHAR(50) NOT NULL,

    -- 9. Metadata
    Load_Timestamp   DATETIME2 DEFAULT SYSDATETIME(),

    -- 10. Constraints
    CONSTRAINT CHK_Customer_Status 
        CHECK (Customer_Status IN ('Active', 'Inactive')),

    CONSTRAINT CHK_Customer_Type 
        CHECK (Customer_Type IN ('Retail', 'Corporate'))
);