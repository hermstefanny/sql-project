SELECT count(enterprise.EnterpriseNumber) as EnterpriseCount,
SUBSTR(CAST(activity.NaceCode AS TEXT), 1, 2) AS NaceCodeGroup,
enterprise.JuridicalForm,
code.Code,
code.Description

FROM
enterprise 
LEFT JOIN
Activity ON activity.EntityNumber = enterprise.EnterpriseNumber
LEFT JOIN code 
    ON code.Code = enterprise.JuridicalForm 
   AND code.Category = 'JuridicalForm'
   AND code.Language = 'FR'

WHERE activity.NaceVersion = '2025'
GROUP BY activity.NaceCode, enterprise.JuridicalForm
ORDER BY activity.NaceCode, EnterpriseCount DESC;
