UPDATE dbo.Customer_Staging
SET Email = LOWER(LTRIM(RTRIM(Email)))
WHERE Email IS NOT NULL;