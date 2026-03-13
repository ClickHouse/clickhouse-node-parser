SELECT *
FROM
    t1
CROSS JOIN t2
CROSS JOIN (
        SELECT a AS x
        FROM t3
        WHERE a + 1 = b
    ) AS t3
WHERE t1.a = if(t2.b > 0, t2.a, 0)
    AND t2.a = t3.x
    AND 1;

SELECT *
FROM
    t1
CROSS JOIN t2
CROSS JOIN (
        SELECT a AS x
        FROM t3
        WHERE a + 1 = b
    ) AS t3
WHERE t1.a = if(t2.b > 0, t2.a, 0)
ORDER BY
    t1.a ASC,
    t2.a ASC,
    t3.x ASC;

SELECT *
FROM
    t1
CROSS JOIN t2
CROSS JOIN t3
CROSS JOIN t4
CROSS JOIN t5
WHERE t2.a = t3.a
    AND t1.b = t5.b;

SELECT *
FROM
    t1
CROSS JOIN t2
CROSS JOIN t3
CROSS JOIN t4
CROSS JOIN t5
WHERE t2.a = t3.a
    AND t1.b = t5.b
    AND t4.a = t5.a;

SELECT *
FROM
    t1
CROSS JOIN t2
CROSS JOIN t3
CROSS JOIN t4
CROSS JOIN t5
WHERE t1.a = t3.a
    AND t3.b = t4.b
    AND t1.a = t4.a
    AND t2.a = t5.a;

SELECT *
FROM
    t1
CROSS JOIN t2
CROSS JOIN t3
CROSS JOIN t4
CROSS JOIN t5
WHERE t1.a = t2.a
    AND t1.a = t3.a
    AND t1.a = t4.a
    AND t1.a = t5.a
    AND t2.a = t3.a
    AND t2.a = t4.a
    AND t2.a = t5.a
    AND t3.a = t4.a
    AND t3.a = t5.a
    AND t4.a = t5.a;

-- { echoOff }
SELECT *
FROM
    t1
CROSS JOIN t2
CROSS JOIN (
        SELECT a AS x
        FROM t3
        WHERE a + 1 = b
    ) AS t3
WHERE t1.a = if(t2.b > 0, t2.a, 0)
SETTINGS cross_to_inner_join_rewrite = 2; -- { serverError INCORRECT_QUERY }