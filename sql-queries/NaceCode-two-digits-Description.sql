WITH aggregated_activity AS (
    SELECT 
        SUBSTR(CAST(NaceCode AS TEXT), 1, 2) AS NaceCodeGroup,
        COUNT(DISTINCT EntityNumber) AS EntityCount
    FROM activity
    WHERE NaceVersion = 2025
    GROUP BY NaceCodeGroup
)

SELECT 
    aa.NaceCodeGroup,
    aa.EntityCount,
    c.Description
FROM aggregated_activity aa
LEFT JOIN code c
    ON c.Code = aa.NaceCodeGroup
   AND c.Category = 'Nace2025'
   AND c.Language = 'FR'
ORDER BY aa.EntityCount DESC;