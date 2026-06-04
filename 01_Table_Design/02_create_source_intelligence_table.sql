USE Customer_Data_Governance_DB;
GO

IF OBJECT_ID('Source_Intelligence', 'U') IS NOT NULL
    DROP TABLE Source_Intelligence;
GO

CREATE TABLE Source_Intelligence
(
    Source_ID BIGINT IDENTITY(1,1) PRIMARY KEY,

    Source_System VARCHAR(50) NOT NULL,
    File_Name VARCHAR(255) NULL,
    File_Size BIGINT NULL,
    File_Format VARCHAR(20) NOT NULL,
    File_Path VARCHAR(500) NULL,
    Source_Schema_Metadata NVARCHAR(MAX) NULL,
    Source_Availability BIT NOT NULL,

    -- File format constraint (project specific)
    CONSTRAINT CHK_File_Format
    CHECK (File_Format = 'XLSX'),

    -- File size constraint
    CONSTRAINT CHK_File_Size
    CHECK (File_Size >= 0 OR File_Size IS NULL),

    -- Availability ↔ File_Name dependency
    CONSTRAINT CHK_Availability_FileName
    CHECK (
        (Source_Availability = 1 AND File_Name IS NOT NULL)
        OR
        (Source_Availability = 0)
    ),

    -- Availability ↔ File_Size dependency
    CONSTRAINT CHK_Availability_FileSize
    CHECK (
        (Source_Availability = 1 AND File_Size > 0)
        OR
        (Source_Availability = 0)
        OR
        (File_Size IS NULL)
    ),

    -- File_Format ↔ File_Name extension
    CONSTRAINT CHK_FileName_Format
    CHECK (
        File_Name IS NULL
        OR File_Name LIKE '%.xlsx'
    ),

    -- Availability ↔ Schema_Metadata
    CONSTRAINT CHK_Availability_Schema
    CHECK (
        (Source_Availability = 1 AND Source_Schema_Metadata IS NOT NULL)
        OR
        (Source_Availability = 0)
    )
);
GO