SELECT
    count() AS d,
    a,
    b,
    c
FROM test02313
GROUP BY ROLLUP(a, b, c)
ORDER BY
    d ASC,
    a ASC,
    b ASC,
    c ASC;

SELECT
    count() AS d,
    a,
    b,
    c
FROM test02313
GROUP BY CUBE(a, b, c)
ORDER BY
    d ASC,
    a ASC,
    b ASC,
    c ASC;

SELECT
    count() AS d,
    a,
    b,
    c
FROM test02313
GROUP BY GROUPING SETS ((c), (a, c), (b, c))
ORDER BY
    d ASC,
    a ASC,
    b ASC,
    c ASC;