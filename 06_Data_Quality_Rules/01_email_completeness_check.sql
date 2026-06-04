INSERT INTO dbo.Customer_Error
(
    Run_ID,
    Customer_ID,
    First_Name,
    Last_Name,
    Email,
    Phone_Number,
    Date_of_Birth,
    City,
    State,
    Country,
    Pincode,
    Customer_Status,
    Customer_Type,
    Created_Date,
    Updated_Date,
    Source_System,
    Batch_ID,

    Error_Code,
    Error_Message,
    Rule_Name,
    Severity_Level,
    Error_Stage,
    Error_Category,
    Load_Timestamp
)
SELECT
    4,

    Customer_ID,
    First_Name,
    Last_Name,
    Email,
    Phone_Number,
    Date_of_Birth,
    City,
    State,
    Country,
    Pincode,
    Customer_Status,
    Customer_Type,
    Created_Date,
    Updated_Date,
    Source_System,
    Batch_ID,

    'ERR001',
    'Email is NULL',
    'Email_Completeness_Check',
    'HIGH',
    'DATA_QUALITY',
    'COMPLETENESS',
    SYSDATETIME()

FROM dbo.Customer_Staging
WHERE Email IS NULL;