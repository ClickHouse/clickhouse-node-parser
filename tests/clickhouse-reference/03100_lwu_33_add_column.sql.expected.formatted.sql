SELECT
    a % 6 AS n,
    sum(b),
    groupUniqArray(c)
FROM t_lwu_add_column
GROUP BY n
ORDER BY n ASC;

SELECT *
FROM t_lwu_add_column
ORDER BY a ASC
LIMIT 10;