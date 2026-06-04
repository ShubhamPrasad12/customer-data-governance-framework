SELECT *
FROM dbo.Customer_Staging
WHERE Email NOT LIKE '%_@_%._%';