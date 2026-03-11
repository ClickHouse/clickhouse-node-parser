SELECT
    `1a`,
    `2b`
FROM
    t1 AS tt1
INNER JOIN (
        SELECT `3c`
        FROM t2
    ) AS tt2
    ON tt1.`1a` = tt2.`3c`
INNER JOIN (
        SELECT `6f`
        FROM t3
    ) AS tt3
    ON tt1.`2b` = tt3.`6f`;

SELECT
    a,
    b
FROM
    t1 AS tt1
INNER JOIN (
        SELECT c
        FROM t2
    ) AS tt2
    ON tt1.a = tt2.c
INNER JOIN (
        SELECT f
        FROM t3
    ) AS tt3
    ON tt1.b = tt3.f;