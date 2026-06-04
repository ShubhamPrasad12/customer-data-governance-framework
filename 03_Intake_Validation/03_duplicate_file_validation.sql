====================================================================
Script Name    : 03_duplicate_file_validation.sql
Project        : Enterprise Customer Data Governance & Validation Framework
Purpose        : Validate duplicate intake file entries
Author         : Shubham Prasad
Created Date   : 2026-05-12
====================================================================

DESCRIPTION:
This script validates whether the same source file
has been registered multiple times in the intake layer.

If duplicate intake is detected:
- File_Status is updated to REJECTED
- Validation_Status is updated to FAILED
- Governance remarks are updated

This supports preventive governance and duplicate
ingestion prevention.

====================================================================
*/

USE Customer_Data_Governance_DB;
GO


UPDATE dbo.Intake_Audit
SET
    File_Status = 'REJECTED',
    Validation_Status = 'FAILED',
    Remarks = 'Duplicate file detected during intake validation'
WHERE File_Name IN
(
    SELECT File_Name
    FROM dbo.Intake_Audit
    GROUP BY File_Name
    HAVING COUNT(*) > 1
);
GO