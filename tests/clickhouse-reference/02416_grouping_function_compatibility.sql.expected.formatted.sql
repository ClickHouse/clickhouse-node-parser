SELECT
    count() AS amount,
    a,
    b,
    GROUPING(a, b)
FROM test02416
GROUP BY GROUPING SETS ((a, b), (a), ())
ORDER BY (amount, a, b) ASC;

SELECT
    count() AS amount,
    a,
    b,
    GROUPING(a, b)
FROM test02416
GROUP BY ROLLUP(a, b)
ORDER BY (amount, a, b) ASC;