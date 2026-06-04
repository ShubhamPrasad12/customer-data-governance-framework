UPDATE dbo.Customer_Staging
SET
    First_Name = LTRIM(RTRIM(First_Name)),
    Last_Name = LTRIM(RTRIM(Last_Name));