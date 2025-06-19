SELECT 
    c.PlanType,
    COUNT(DISTINCT CASE WHEN ch.churned = 1 THEN ch.CustomerID END) AS ChurnedCustomers,
    COUNT(DISTINCT c.CustomerID) AS TotalCustomers,
    ROUND(
        COUNT(DISTINCT CASE WHEN ch.Churned = 1 THEN ch.CustomerID END) / COUNT(DISTINCT c.CustomerID) * 100, 2
    ) AS ChurnRatePercent
FROM 
    customer c
LEFT JOIN 
    churn ch ON c.CustomerID = ch.CustomerID
GROUP BY 
    c.PlanType;
