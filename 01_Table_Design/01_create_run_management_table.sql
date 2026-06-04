USE Customer_Data_Governance_DB;
GO

IF OBJECT_ID('Run_Management', 'U') IS NOT NULL
    DROP TABLE Run_Management;
GO

CREATE TABLE Run_Management
(
    Run_ID BIGINT IDENTITY(1,1) PRIMARY KEY,

    Pipeline_Name VARCHAR(100) NOT NULL,
    Batch_ID VARCHAR(50) NOT NULL,
    Run_Granularity VARCHAR(20) NOT NULL,
    Retry_Run_ID BIGINT NULL,

    Start_Time DATETIME2 NOT NULL,
    End_Time DATETIME2 NULL,

    Status VARCHAR(20) NOT NULL,
    Trigger_Type VARCHAR(20) NOT NULL,

    Rows_Processed BIGINT NOT NULL DEFAULT 0,
    Error_Message VARCHAR(500) NULL,

    -- Status + End_Time logic
    CONSTRAINT CHK_Status_Time_Validation
    CHECK
    (
        Status IN ('START', 'IN_PROCESS', 'SUCCESS', 'FAILED')
        AND
        (
            (Status IN ('START', 'IN_PROCESS') AND End_Time IS NULL)
            OR
            (Status = 'SUCCESS' AND End_Time IS NOT NULL)
            OR
            (Status = 'FAILED' AND End_Time IS NULL)
        )
    ),

    -- Rows processed validation
    CONSTRAINT CHK_Rows_Processed
    CHECK (Rows_Processed >= 0),

    -- Time sequence validation
    CONSTRAINT CHK_Time_Validation
    CHECK (End_Time >= Start_Time OR End_Time IS NULL)
);
GO