SELECT 
COUNT(Distinct activity.EntityNumber) as Entity_by_NACE_Activity, 
activity.NaceCode, 
activity.NaceVersion

FROM 
activity
GROUP BY activity.NaceCode
ORDER BY Entity_by_NACE_Activity DESC

;