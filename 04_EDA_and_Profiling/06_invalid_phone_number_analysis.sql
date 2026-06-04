
SELECT *
FROM dbo.Customer_Staging
WHERE Phone_Number LIKE '%[^0-9]%';