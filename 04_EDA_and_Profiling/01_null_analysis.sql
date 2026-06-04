/*
====================================================================
Script Name    : 01_null_analysis.sql
Project        : Enterprise Customer Data Governance & Validation Framework
Purpose        : Perform null analysis on Customer_Staging table
Author         : Shubham Prasad
Created Date   : 2026-05-12
====================================================================

DESCRIPTION:
This script performs structural profiling by identifying
NULL occurrences across important business columns
inside the Customer_Staging table.

This helps identify:
- missing business information
- incomplete customer records
- governance-sensitive data gaps

SELECT
    COUNT(*) AS Total_Rows,

    SUM(CASE WHEN Staging_ID IS NULL THEN 1 ELSE 0 END) AS Null_Staging_ID,

    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Null_Customer_ID,

    SUM(CASE WHEN First_Name IS NULL THEN 1 ELSE 0 END) AS Null_First_Name,

    SUM(CASE WHEN Last_Name IS NULL THEN 1 ELSE 0 END) AS Null_Last_Name,

    SUM(CASE WHEN Email IS NULL THEN 1 ELSE 0 END) AS Null_Email,

    SUM(CASE WHEN Phone_Number IS NULL THEN 1 ELSE 0 END) AS Null_Phone_Number,

    SUM(CASE WHEN Date_of_Birth IS NULL THEN 1 ELSE 0 END) AS Null_Date_Of_Birth,

    SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END) AS Null_City,

    SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS Null_State,

    SUM(CASE WHEN Country IS NULL THEN 1 ELSE 0 END) AS Null_Country,

    SUM(CASE WHEN Pincode IS NULL THEN 1 ELSE 0 END) AS Null_Pincode,

    SUM(CASE WHEN Customer_Status IS NULL THEN 1 ELSE 0 END) AS Null_Customer_Status,

    SUM(CASE WHEN Customer_Type IS NULL THEN 1 ELSE 0 END) AS Null_Customer_Type,

    SUM(CASE WHEN Created_Date IS NULL THEN 1 ELSE 0 END) AS Null_Created_Date,

    SUM(CASE WHEN Updated_Date IS NULL THEN 1 ELSE 0 END) AS Null_Updated_Date,

    SUM(CASE WHEN Source_System IS NULL THEN 1 ELSE 0 END) AS Null_Source_System,

    SUM(CASE WHEN Batch_ID IS NULL THEN 1 ELSE 0 END) AS Null_Batch_ID,

    SUM(CASE WHEN Load_Timestamp IS NULL THEN 1 ELSE 0 END) AS Null_Load_Timestamp

FROM dbo.Customer_Staging;