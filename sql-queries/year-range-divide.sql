    SELECT 
        SUBSTR(CAST(a.NaceCode AS TEXT), 1, 2) AS NaceCodeGroup,
		CASE
			WHEN CAST(SUBSTR(e.StartDate, 7,4) AS INTEGER) <1920 THEN "Before 1920"
			WHEN CAST(SUBSTR(e.StartDate, 7,4) AS INTEGER) BETWEEN 1920 AND 1939 THEN "1920-1939"
			WHEN CAST(SUBSTR(e.StartDate, 7,4) AS INTEGER) BETWEEN 1940 AND 1959 THEN "1940-1959"
			WHEN CAST(SUBSTR(e.StartDate, 7,4) AS INTEGER) BETWEEN 1960 AND 1989 THEN "1960-1989"
			WHEN CAST(SUBSTR(e.StartDate, 7,4) AS INTEGER) BETWEEN 1990 AND 2009 THEN "1990-2009"
			WHEN CAST(SUBSTR(e.StartDate, 7,4) AS INTEGER) >= 2010 THEN "After 2010"
			ELSE "Others"
		END as "CreationYear",
		
        COUNT(DISTINCT a.EntityNumber) AS EntityCount
		
    FROM activity a
    INNER JOIN enterprise e
        ON a.EntityNumber = e.EnterpriseNumber
		
    WHERE a.NaceVersion = 2025
    GROUP BY NaceCodeGroup, CreationYear
	ORDER BY EntityCount DESC;
