SELECT
Rule_Name,
COUNT(*) AS Failure_Count
FROM Customer_Error
GROUP BY Rule_Name
ORDER BY Failure_Count DESC;