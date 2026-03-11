
SELECT
    count() as d, a, b, c
FROM test02313
GROUP BY ROLLUP(a, b, c)
ORDER BY d, a, b, c;
SELECT
    count() as d, a, b, c
FROM test02313
GROUP BY CUBE(a, b, c)
ORDER BY d, a, b, c;
SELECT
    count() as d, a, b, c
FROM test02313
GROUP BY GROUPING SETS
    (
        (c),
        (a, c),
        (b, c)
    )
ORDER BY d, a, b, c;
