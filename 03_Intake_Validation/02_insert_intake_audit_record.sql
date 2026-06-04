/*
====================================================================
Script Name    : 02_insert_intake_audit_record.sql
Project        : Enterprise Customer Data Governance & Validation Framework
Purpose        : Insert intake metadata record into Intake_Audit
Author         : Shubham Prasad
Created Date   : 2026-05-12
====================================================================

DESCRIPTION:
This script registers the arrival of the FILE-based
customer master source file into the intake governance layer.

This is the first operational intake registration step
before source intake validation and ingestion.

====================================================================
*/

USE Customer_Data_Governance_DB;
GO


INSERT INTO dbo.Intake_Audit
(
    File_Name,
    Source_Name,
    Source_Type,
    File_Status,
    Validation_Status,
    Record_Count,
    Batch_ID,
    Loaded_By,
    Remarks
)
VALUES
(
    'customer_master_data.csv',
    'CUSTOMER_MASTER_FILE',
    'FILE',
    'RECEIVED',
    'PENDING',
    NULL,
    NULL,
    'SHUBHAM',
    'Initial customer master file received for intake processing'
);
GO