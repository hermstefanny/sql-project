SELECT 
	COUNT(DISTINCT enterprise.EnterpriseNumber) as EnterpriseCount, 
	COALESCE(address.MunicipalityFR, address.MunicipalityNL, 'Unknown') AS BelgianMunicipality,
	address.Zipcode,
	CASE
		WHEN address.CountryFR IS NOT NULL THEN "OTHER COUNTRY"
		ELSE "BEL"
	END as "Country"
		
FROM
	enterprise
	LEFT JOIN establishment  ON establishment.EnterpriseNumber = enterprise.EnterpriseNumber
	LEFT JOIN address  ON address.EntityNumber = establishment.EstablishmentNumber

GROUP BY BelgianMunicipality
ORDER BY EnterpriseCount DESC
;
