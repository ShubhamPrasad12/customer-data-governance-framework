SELECT
    Customer_ID,
    COUNT(*) AS Duplicate_Count

FROM dbo.Customer_Staging

GROUP BY Customer_ID

HAVING COUNT(*) > 1;