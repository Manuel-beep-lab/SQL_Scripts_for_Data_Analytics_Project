SELECT 
    COUNT(DISTINCT CASE WHEN b.PaymentStatus = 'Unpaid' THEN b.CustomerID END) AS UnpaidCustomers,
    COUNT(DISTINCT b.CustomerID) AS TotalBilledCustomers,
    ROUND(
        COUNT(DISTINCT CASE WHEN b.PaymentStatus = 'Unpaid' THEN b.CustomerID END)
        / COUNT(DISTINCT b.CustomerID) * 100, 2
    ) AS UnpaidRatePercent
FROM 
    billing b;
