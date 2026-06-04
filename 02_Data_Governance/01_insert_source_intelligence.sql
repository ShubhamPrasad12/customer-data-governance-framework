INSERT INTO dbo.Source_Intelligence
(
    Source_System,
    File_Name,
    File_Size,
    File_Format,
    File_Path,
    Source_Schema_Metadata,
    Source_Availability
)
VALUES
(
    'CRM_System',
    'Customer_Master_Data_20260503_BATCH001.csv',
    7600,
    'CSV',
    'C:\Program Files\Microsoft SQL Server\Customer_Master_Data_20260503_BATCH001.csv',
    'Customer_Staging_Load',
    1
);