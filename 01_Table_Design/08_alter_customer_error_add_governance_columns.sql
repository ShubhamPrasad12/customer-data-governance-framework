ALTER TABLE dbo.Customer_Error
ADD
    Rule_Name VARCHAR(200),
    Severity_Level VARCHAR(50),
    Error_Stage VARCHAR(100),
    Error_Category VARCHAR(100);