SELECT COUNT (DISTINCT enterprise.EnterpriseNumber)
FROM
Activity
JOIN enterprise 
ON activity.EntityNumber = enterprise.EnterpriseNumber
WHERE NaceVersion = 2025 
AND CAST(NaceCode AS TEXT) LIKE '47%';