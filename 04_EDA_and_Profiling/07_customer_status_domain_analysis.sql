SELECT
    Customer_Status,
    COUNT(*) AS Total_Count

FROM dbo.Customer_Staging

GROUP BY Customer_Status

ORDER BY Total_Count DESC;