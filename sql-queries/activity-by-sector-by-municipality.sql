    SELECT 
        SUBSTR(CAST(activity.NaceCode AS TEXT), 1, 2) AS NaceCodeGroup,
		COALESCE(address.MunicipalityFR, address.MunicipalityNL, 'Unknown') AS BelgianMunicipality,
		address.Zipcode,
		CASE
			WHEN address.CountryFR IS NOT NULL THEN "OTHER COUNTRY"
			ELSE "BEL"
	END as "Country",
        COUNT(DISTINCT activity.EntityNumber) AS EntityCount
    FROM activity 
    INNER JOIN enterprise  ON activity.EntityNumber = enterprise.EnterpriseNumber
	LEFT JOIN establishment  ON establishment.EnterpriseNumber = enterprise.EnterpriseNumber
	LEFT JOIN address  ON address.EntityNumber = establishment.EstablishmentNumber
	
    WHERE activity.NaceVersion = 2025

	GROUP BY NaceCodeGroup, BelgianMunicipality
	ORDER BY EntityCount DESC;