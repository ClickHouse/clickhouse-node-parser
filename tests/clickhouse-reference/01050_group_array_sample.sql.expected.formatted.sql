SELECT
    k,
    groupArraySample(10, 123456)(v)
FROM (
        SELECT
            number % 4 AS k,
            number AS v
        FROM numbers(1024)
    )
GROUP BY k
ORDER BY k ASC;

-- different seed
SELECT
    k,
    groupArraySample(10, 1)(v)
FROM (
        SELECT
            number % 4 AS k,
            number AS v
        FROM numbers(1024)
    )
GROUP BY k
ORDER BY k ASC;