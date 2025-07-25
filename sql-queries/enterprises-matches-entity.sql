SELECT COUNT(*) AS MatchesWithEnterprise
FROM address a
JOIN enterprise e ON a.EntityNumber = e.EnterpriseNumber;
