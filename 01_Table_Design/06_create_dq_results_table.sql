============================================================
File Name     : 06_create_dq_results_table.sql
Table Name    : DQ_Results
Purpose       : Stores data quality summary metrics per run
Layer         : Data Quality Reporting
============================================================
*/

CREATE TABLE dbo.DQ_Results
(
    -- 1. System Key
    Result_ID INT IDENTITY(1,1) PRIMARY KEY,

    -- 2. Run Tracking
    Run_ID INT NOT NULL,

    -- 3. Metrics
    Total_Records        INT NOT NULL,
    Valid_Records        INT NOT NULL,
    Invalid_Records      INT NOT NULL,

    -- 4. Data Quality Score
    Data_Quality_Percentage DECIMAL(5,2),

    -- 5. Metadata
    Created_Timestamp DATETIME2 DEFAULT SYSDATETIME()
);