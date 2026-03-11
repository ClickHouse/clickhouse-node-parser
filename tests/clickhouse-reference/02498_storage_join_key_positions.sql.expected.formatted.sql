SELECT '--- using ---';

SELECT *
FROM
    t1
INNER JOIN tj
    USING (key1, key2, key3)
ORDER BY key1 ASC;

SELECT
    key1,
    key2,
    key3,
    attr
FROM
    t1
INNER JOIN tj
    USING (key1, key2, key3)
ORDER BY key1 ASC;

SELECT
    key1,
    key2,
    key3,
    attr
FROM
    t1
INNER JOIN tj
    USING (key2, key3, key1)
ORDER BY key1 ASC;

SELECT
    key1,
    key2,
    key3,
    attr
FROM
    t1
INNER JOIN tj
    USING (key3, key2, key1)
ORDER BY key1 ASC;

SELECT
    key1,
    key2,
    key3,
    attr
FROM
    t1
INNER JOIN tj
    USING (key1, key3, key2)
ORDER BY key1 ASC;

SELECT *
FROM
    t1
INNER JOIN tj
    ON t1.key3 = tj.key3
    AND t1.key2 = tj.key2
    AND t1.key1 = tj.key1
ORDER BY t1.key1 ASC;

SELECT *
FROM
    t1
INNER JOIN tj
    ON t1.key2 = tj.key2
    AND t1.key3 = tj.key3
    AND t1.key1 = tj.key1
ORDER BY t1.key1 ASC;

SELECT *
FROM
    t1
INNER JOIN tj
    ON t1.key3 = tj.key3
    AND t1.key1 = tj.key1
    AND t1.key2 = tj.key2
ORDER BY t1.key1 ASC;

SELECT *
FROM
    t1
INNER JOIN tj
    ON t1.key1 = tj.key1
    AND t1.key3 = tj.key3
    AND t1.key2 = tj.key2
ORDER BY t1.key1 ASC;

SELECT *
FROM
    (
        SELECT
            key3 AS c,
            key1 AS a,
            key2 AS b
        FROM t1
    ) AS t1
INNER JOIN tj
    ON t1.a = tj.key1
    AND t1.c = tj.key3
    AND t1.b = tj.key2
ORDER BY t1.a ASC;

SELECT *
FROM
    (
        SELECT
            key3 AS c,
            key1 AS a,
            key2 AS b
        FROM t1
    ) AS t1
INNER JOIN tj
    ON t1.a = tj.key1
    AND t1.b = tj.key2
    AND t1.c = tj.key3
ORDER BY t1.a ASC;

SELECT *
FROM
    (
        SELECT
            key3 AS c,
            key1 AS a,
            key2 AS b
        FROM t1
    ) AS t1
INNER JOIN tj
    ON t1.c = tj.key3
    AND t1.a = tj.key1
    AND t1.b = tj.key2
ORDER BY t1.a ASC;

SELECT *
FROM
    t1
INNER JOIN tj
    ON t1.key1 = tj.key1
    AND t1.key3 = tj.key3
    AND t1.key2 = tj.key2
    AND 0;

SELECT *
FROM
    t1
INNER JOIN tj
    ON t1.key1 = tj.key1
    AND t1.key3 = tj.key3
    AND t1.key2 = tj.key2
    AND 1 > 1;

SELECT *
FROM
    t1
INNER JOIN tj
    ON 1;

SELECT *
FROM
    t1
INNER JOIN tj
    ON 0;

SELECT *
FROM
    t1
INNER JOIN tj
    ON NULL;

SELECT *
FROM
    t1
INNER JOIN tj
    ON 1 != 1;

SELECT *
FROM
    t1
INNER JOIN tj
    ON 1 == 1;

SELECT *
FROM
    t1
INNER JOIN tj
    ON 1 == 2;

SELECT *
FROM
    t1
INNER JOIN tj
    USING (key1, key2, attr);

SELECT *
FROM
    t1
INNER JOIN tj
    USING (key1, key2, key3, attr);

SELECT *
FROM
    t1
INNER JOIN tj
    USING (key2, key3);

SELECT *
FROM
    t1
INNER JOIN tj
    ON t1.key1 = tj.attr;

SELECT *
FROM
    t1
INNER JOIN tj
    ON t1.key1 = tj.key1;

SELECT *
FROM
    t1
INNER JOIN tj
    ON t1.key1 = tj.key1
    AND t1.key2 = tj.key2
    AND t1.key3 = tj.attr;

SELECT *
FROM
    t1
INNER JOIN tj
    ON t1.key1 = tj.key1
    AND t1.key2 = tj.key2
    AND t1.key3 = tj.key3
    AND t1.key1 = tj.key1;

SELECT *
FROM
    t1
INNER JOIN tjj
    ON t1.key1 = tjj.key1
    AND t1.key1 = tjj.key2
    AND t1.key1 = tjj.key3
ORDER BY t1.key1 ASC;

SELECT *
FROM
    t1
INNER JOIN tjj
    ON t1.key1 = tjj.key1
    AND t1.key1 = tjj.key3
    AND t1.key1 = tjj.key2
ORDER BY t1.key1 ASC;