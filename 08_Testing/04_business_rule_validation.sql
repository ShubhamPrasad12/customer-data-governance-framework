SELECT Customer_Status, COUNT(*) 
FROM dbo.Customer_Staging
GROUP BY Customer_Status;

SELECT Customer_Type, COUNT(*) 
FROM dbo.Customer_Staging
GROUP BY Customer_Type;