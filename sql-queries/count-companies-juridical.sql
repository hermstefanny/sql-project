SELECT 
Count(Distinct enterprise.EnterpriseNumber) as Enterprises_by_juridical, 
enterprise.JuridicalForm, 
code.Category, 
code.Description, 
code.Code

FROM 
enterprise
LEFT JOIN code ON code.Code = enterprise.JuridicalForm
AND code.Category = 'JuridicalForm'
AND code.Language = 'FR'
GROUP BY enterprise.JuridicalForm
;