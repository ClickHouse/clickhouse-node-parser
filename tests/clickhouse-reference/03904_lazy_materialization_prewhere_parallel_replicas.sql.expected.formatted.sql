SELECT
    a + 1 AS a,
    b AS b,
    c + 1 AS c,
    d + 1 AS d
FROM t_lazy_mat_prewhere_parallel
WHERE d > 1
ORDER BY c ASC
LIMIT 3;

SELECT *
FROM t_lazy_mat_prewhere_parallel
WHERE d > 1
ORDER BY c ASC
LIMIT 3;

SELECT
    a,
    b,
    c,
    d
FROM t_lazy_mat_prewhere_parallel
WHERE d > 1
ORDER BY c ASC
LIMIT 3;

SELECT
    a + 1 AS a,
    b AS b,
    c + 1 AS c,
    d + 1 AS d
FROM t_lazy_mat_prewhere_parallel
PREWHERE d > 1
ORDER BY c ASC
LIMIT 3;

SELECT *
FROM t_lazy_mat_prewhere_parallel
PREWHERE d > 1
ORDER BY c ASC
LIMIT 3;