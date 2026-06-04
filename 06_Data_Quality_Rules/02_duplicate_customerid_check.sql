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

    cs.Customer_ID,
    cs.First_Name,
    cs.Last_Name,
    cs.Email,
    cs.Phone_Number,
    cs.Date_of_Birth,
    cs.City,
    cs.State,
    cs.Country,
    cs.Pincode,
    cs.Customer_Status,
    cs.Customer_Type,
    cs.Created_Date,
    cs.Updated_Date,
    cs.Source_System,
    cs.Batch_ID,

    'ERR002',
    'Duplicate Customer_ID found',
    'CustomerID_Uniqueness_Check',
    'HIGH',
    'DATA_QUALITY',
    'UNIQUENESS',
    SYSDATETIME()

FROM dbo.Customer_Staging cs
INNER JOIN
(
    SELECT Customer_ID
    FROM dbo.Customer_Staging
    GROUP BY Customer_ID
    HAVING COUNT(*) > 1
) dup
ON cs.Customer_ID = dup.Customer_ID;