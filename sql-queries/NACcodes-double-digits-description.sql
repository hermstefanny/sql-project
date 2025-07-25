   SELECT
   c.code, c.Description
	FROM
	code c
	Where c.Category = 'Nace2025'   AND c.Language = 'FR' AND c.code LIKE '__'