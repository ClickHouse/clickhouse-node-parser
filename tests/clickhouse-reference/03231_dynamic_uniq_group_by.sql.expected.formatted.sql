SELECT uniqExact(d)
FROM test;

SELECT
    count(),
    d
FROM test
GROUP BY d
ORDER BY d ASC;