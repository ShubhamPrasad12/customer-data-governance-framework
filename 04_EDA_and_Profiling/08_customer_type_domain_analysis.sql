SELECT
    Customer_Type,
    COUNT(*) AS Total_Count
FROM dbo.Customer_Staging
GROUP BY Customer_Type
ORDER BY Total_Count DESC;