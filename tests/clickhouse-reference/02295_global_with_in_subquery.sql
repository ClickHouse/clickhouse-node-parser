SELECT number FROM numbers(10)
WHERE number IN (
    WITH (SELECT 1) AS v1, (SELECT 2) AS v2
    SELECT v1 AS v
    UNION ALL
    SELECT v2 AS v
);
