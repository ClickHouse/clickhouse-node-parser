SELECT
    c0,
    c0.size
FROM t0;

SELECT t0.c0.size
FROM t0
WHERE t0.c0 IN (1);

SELECT 1
FROM
    (
        SELECT 1 AS c0
    ) AS t1
CROSS JOIN t0
GROUP BY
    t0.c3,
    t0.c3.size;

SELECT concat([1], c0.size)
FROM t0
GROUP BY
    1,
    c0,
    c0.size
WITH ROLLUP
FORMAT Null;