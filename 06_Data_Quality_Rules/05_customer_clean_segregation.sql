INSERT INTO dbo.Customer_Clean
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
    SYSDATETIME()

FROM dbo.Customer_Staging cs
WHERE NOT EXISTS
(
    SELECT 1
    FROM dbo.Customer_Error ce
    WHERE ce.Customer_ID = cs.Customer_ID
);