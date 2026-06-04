UPDATE dbo.Customer_Staging
SET
    City = LTRIM(RTRIM(City)),
    State = LTRIM(RTRIM(State));