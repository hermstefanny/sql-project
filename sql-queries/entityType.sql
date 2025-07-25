SELECT 
    activity.EntityNumber,
    CASE 
        WHEN enterprise.EnterpriseNumber IS NOT NULL THEN 'enterprise'
        WHEN establishment.EstablishmentNumber IS NOT NULL THEN 'establishment'
        ELSE 'unknown'
    END AS EntityType
FROM activity 
LEFT JOIN enterprise ON activity.EntityNumber = enterprise.EnterpriseNumber
LEFT JOIN establishment ON activity.EntityNumber = establishment.EstablishmentNumber

