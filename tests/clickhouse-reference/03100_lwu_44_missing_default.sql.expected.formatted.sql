SELECT
    intDiv(z, 100) AS a,
    COUNT() AS b
FROM t_lwu_defaults
GROUP BY a
ORDER BY a ASC
LIMIT 10;

SELECT
    intDiv(z, 100) AS a,
    COUNT() AS b
FROM t_mutation_defaults
GROUP BY a
ORDER BY a ASC
LIMIT 10;