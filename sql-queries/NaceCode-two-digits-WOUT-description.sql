    SELECT 
        SUBSTR(CAST(a.NaceCode AS TEXT), 1, 2) AS NaceCodeGroup,
        COUNT(DISTINCT a.EntityNumber) AS EntityCount
    FROM activity a
    INNER JOIN enterprise e
        ON a.EntityNumber = e.EnterpriseNumber
    WHERE a.NaceVersion = 2025
    GROUP BY NaceCodeGroup
	ORDER BY EntityCount DESC
