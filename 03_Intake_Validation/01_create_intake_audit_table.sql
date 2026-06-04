Script Name    : 01_create_intake_audit_table.sql
Project        : Enterprise Customer Data Governance & Validation Framework
Purpose        : Create Intake_Audit table for intake governance tracking
Author         : Shubham Prasad
Created Date   : 2026-05-12
====================================================================

DESCRIPTION:
This script creates the Intake_Audit table which acts as the
formal intake governance and audit layer of the framework.

The table stores operational and governance metadata related
to incoming FILE-based customer master intake events.

CURRENT SOURCE IMPLEMENTATION:
- Source Type  : FILE
- File Format  : CSV
- Intake Method: Manual intake from local environment

FUTURE SCALABILITY SUPPORT:
- FILE
- API
- DATABASE
- ERP
- SFTP

====================================================================
*/

USE Customer_Data_Governance_DB;
GO


CREATE TABLE dbo.Intake_Audit
(
    ------------------------------------------------------------
    -- Unique Intake Event Identifier
    ------------------------------------------------------------
    Intake_ID INT IDENTITY(1,1),

    ------------------------------------------------------------
    -- Incoming Source File Name
    ------------------------------------------------------------
    File_Name VARCHAR(255) NOT NULL,

    ------------------------------------------------------------
    -- Source System Identifier
    ------------------------------------------------------------
    Source_Name VARCHAR(100) NOT NULL,

    ------------------------------------------------------------
    -- Source Type
    ------------------------------------------------------------
    Source_Type VARCHAR(50) NOT NULL,

    ------------------------------------------------------------
    -- Intake Arrival Timestamp
    ------------------------------------------------------------
    Intake_Timestamp DATETIME NOT NULL
        CONSTRAINT DF_Intake_Audit_Intake_Timestamp
        DEFAULT GETDATE(),

    ------------------------------------------------------------
    -- Intake Lifecycle Status
    ------------------------------------------------------------
    File_Status VARCHAR(50) NOT NULL
        CONSTRAINT DF_Intake_Audit_File_Status
        DEFAULT 'RECEIVED',

    ------------------------------------------------------------
    -- Governance Validation Status
    ------------------------------------------------------------
    Validation_Status VARCHAR(50) NOT NULL
        CONSTRAINT DF_Intake_Audit_Validation_Status
        DEFAULT 'PENDING',

    ------------------------------------------------------------
    -- Total Records Received
    ------------------------------------------------------------
    Record_Count INT NULL,

    ------------------------------------------------------------
    -- Batch Identifier for Lineage Tracking
    ------------------------------------------------------------
    Batch_ID VARCHAR(100) NULL,

    ------------------------------------------------------------
    -- User / Process / Service Account
    ------------------------------------------------------------
    Loaded_By VARCHAR(100) NULL,

    ------------------------------------------------------------
    -- Operational Governance Remarks
    ------------------------------------------------------------
    Remarks VARCHAR(500) NULL,

    ------------------------------------------------------------
    -- Metadata Creation Timestamp
    ------------------------------------------------------------
    Created_Date DATETIME NOT NULL
        CONSTRAINT DF_Intake_Audit_Created_Date
        DEFAULT GETDATE(),

    ------------------------------------------------------------
    -- PRIMARY KEY CONSTRAINT
    ------------------------------------------------------------
    CONSTRAINT PK_Intake_Audit
        PRIMARY KEY (Intake_ID),

    ------------------------------------------------------------
    -- FILE STATUS VALIDATION
    ------------------------------------------------------------
    CONSTRAINT CHK_Intake_Audit_File_Status
        CHECK (File_Status IN
        (
            'RECEIVED',
            'ACCEPTED',
            'REJECTED',
            'FAILED'
        )),

    ------------------------------------------------------------
    -- VALIDATION STATUS ENFORCEMENT
    ------------------------------------------------------------
    CONSTRAINT CHK_Intake_Audit_Validation_Status
        CHECK (Validation_Status IN
        (
            'PENDING',
            'PASSED',
            'FAILED'
        )),

    ------------------------------------------------------------
    -- SOURCE TYPE ENFORCEMENT
    ------------------------------------------------------------
    CONSTRAINT CHK_Intake_Audit_Source_Type
        CHECK (Source_Type IN
        (
            'FILE',
            'API',
            'DATABASE',
            'ERP',
            'SFTP'
        )),

    ------------------------------------------------------------
    -- RECORD COUNT VALIDATION
    ------------------------------------------------------------
    CONSTRAINT CHK_Intake_Audit_Record_Count
        CHECK (Record_Count >= 0),

    ------------------------------------------------------------
    -- PREVENT BLANK FILE NAMES
    ------------------------------------------------------------
    CONSTRAINT CHK_Intake_Audit_File_Name
        CHECK (LTRIM(RTRIM(File_Name)) <> ''),

    ------------------------------------------------------------
    -- PREVENT BLANK SOURCE NAMES
    ------------------------------------------------------------
    CONSTRAINT CHK_Intake_Audit_Source_Name
        CHECK (LTRIM(RTRIM(Source_Name)) <> '')
);
GO

----