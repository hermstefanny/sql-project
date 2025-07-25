SELECT COUNT(*) AS UnknownEntityType
FROM address a
LEFT JOIN enterprise e ON a.EntityNumber = e.EnterpriseNumber
LEFT JOIN establishment est ON a.EntityNumber = est.EstablishmentNumber
WHERE e.EnterpriseNumber IS NULL AND est.EstablishmentNumber IS NULL;
