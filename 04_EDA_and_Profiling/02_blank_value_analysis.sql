SELECT
    COUNT(*) AS Total_Rows,

    SUM(CASE WHEN LTRIM(RTRIM(First_Name)) = '' THEN 1 ELSE 0 END) AS Blank_First_Name,

    SUM(CASE WHEN LTRIM(RTRIM(Last_Name)) = '' THEN 1 ELSE 0 END) AS Blank_Last_Name,

    SUM(CASE WHEN LTRIM(RTRIM(Email)) = '' THEN 1 ELSE 0 END) AS Blank_Email,

    SUM(CASE WHEN LTRIM(RTRIM(Phone_Number)) = '' THEN 1 ELSE 0 END) AS Blank_Phone_Number,

    SUM(CASE WHEN LTRIM(RTRIM(City)) = '' THEN 1 ELSE 0 END) AS Blank_City,

    SUM(CASE WHEN LTRIM(RTRIM(State)) = '' THEN 1 ELSE 0 END) AS Blank_State,

    SUM(CASE WHEN LTRIM(RTRIM(Country)) = '' THEN 1 ELSE 0 END) AS Blank_Country,

    SUM(CASE WHEN LTRIM(RTRIM(Pincode)) = '' THEN 1 ELSE 0 END) AS Blank_Pincode,

    SUM(CASE WHEN LTRIM(RTRIM(Customer_Status)) = '' THEN 1 ELSE 0 END) AS Blank_Customer_Status,

    SUM(CASE WHEN LTRIM(RTRIM(Customer_Type)) = '' THEN 1 ELSE 0 END) AS Blank_Customer_Type,

    SUM(CASE WHEN LTRIM(RTRIM(Source_System)) = '' THEN 1 ELSE 0 END) AS Blank_Source_System,

    SUM(CASE WHEN LTRIM(RTRIM(Batch_ID)) = '' THEN 1 ELSE 0 END) AS Blank_Batch_ID

FROM dbo.Customer_Staging;