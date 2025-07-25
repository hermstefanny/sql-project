SELECT COUNT(*) AS MatchesWithEstablishment
FROM address a
JOIN establishment est ON a.EntityNumber = est.EstablishmentNumber;
