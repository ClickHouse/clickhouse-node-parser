SELECT
    c1,
    c2,
    c3
FROM test
GROUP BY
    c1,
    c2,
    c3
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT DISTINCT
    c1,
    c2,
    c3
FROM test;