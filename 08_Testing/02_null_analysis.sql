SELECT 
    COUNT(*) AS Total_Rows,

    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Null_Customer_ID,
    SUM(CASE WHEN Email IS NULL THEN 1 ELSE 0 END) AS Null_Email,
    SUM(CASE WHEN Phone_Number IS NULL THEN 1 ELSE 0 END) AS Null_Phone,
    SUM(CASE WHEN Date_of_Birth IS NULL THEN 1 ELSE 0 END) AS Invalid_DOB,

    SUM(CASE WHEN Created_Date IS NULL THEN 1 ELSE 0 END) AS Invalid_Created_Date,
    SUM(CASE WHEN Updated_Date IS NULL THEN 1 ELSE 0 END) AS Invalid_Updated_Date

FROM dbo.Customer_Staging;