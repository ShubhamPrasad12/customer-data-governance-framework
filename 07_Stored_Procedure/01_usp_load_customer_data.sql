ALTER PROCEDURE usp_Load_Customer_Data
AS
BEGIN

    DECLARE @Run_ID BIGINT;

    BEGIN TRY

        INSERT INTO dbo.Run_Management
        (
            Pipeline_Name,
            Batch_ID,
            Run_Granularity,
            Start_Time,
            Status,
            Trigger_Type,
            Rows_Processed
        )
        VALUES
        (
            'Customer_Data_Pipeline',
            'BATCH_001',
            'FULL_LOAD',
            SYSDATETIME(),
            'START',
            'MANUAL',
            (SELECT COUNT(*) FROM dbo.Customer_Staging_Load)
        );

        SET @Run_ID = SCOPE_IDENTITY();

        INSERT INTO dbo.Customer_Staging
        (
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
            Batch_ID
        )
        SELECT
            Customer_ID,
            First_Name,
            Last_Name,
            Email,
            Phone_Number,
            TRY_CONVERT(DATE, Date_of_Birth),
            City,
            State,
            Country,
            Pincode,
            Customer_Status,
            Customer_Type,
            TRY_CONVERT(DATETIME, Created_Date),
            TRY_CONVERT(DATETIME, Updated_Date),
            Source_System,
            Batch_ID
        FROM dbo.Customer_Staging_Load;

        UPDATE dbo.Run_Management
        SET 
            Status = 'SUCCESS',
            End_Time = SYSDATETIME()
        WHERE Run_ID = @Run_ID;

    END TRY

    BEGIN CATCH

        UPDATE dbo.Run_Management
        SET 
            Status = 'FAILED',
            End_Time = SYSDATETIME(),
            Error_Message = ERROR_MESSAGE()
        WHERE Run_ID = @Run_ID;

    END CATCH

END;