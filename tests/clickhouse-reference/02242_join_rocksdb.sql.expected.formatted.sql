SELECT '-- key rename';

SELECT *
FROM
    (
        SELECT k AS key
        FROM t2
    ) AS t2
INNER JOIN rdb
    ON rdb.key == t2.key
ORDER BY key ASC;

SELECT *
FROM
    (
        SELECT k AS key
        FROM t2
    ) AS t2
INNER JOIN rdb
    USING (key)
ORDER BY key ASC;

SELECT k
FROM
    t2
LEFT JOIN rdb
    ON rdb.key == t2.k
ORDER BY k ASC;

SELECT k
FROM
    t2
LEFT JOIN rdb
    ON rdb.key == t2.k
ORDER BY k ASC;

SELECT
    k,
    key,
    toTypeName(value2),
    value2
FROM
    t2
LEFT JOIN rdb
    ON rdb.key == t2.k
ORDER BY k ASC
SETTINGS join_use_nulls = 1;

SELECT
    k,
    key,
    toTypeName(value2),
    value2
FROM
    t2
INNER JOIN rdb
    ON rdb.key == t2.k
ORDER BY k ASC
SETTINGS join_use_nulls = 1;

SELECT value2
FROM
    t2
LEFT JOIN rdb
    ON rdb.key == t2.k
ORDER BY k ASC;

SELECT *
FROM
    t2
INNER JOIN rdb
    ON rdb.key == t2.k
ORDER BY rdb.key ASC;

SELECT *
FROM
    (
        SELECT toUInt64(k) AS k
        FROM t2
    ) AS t2
INNER JOIN rdb
    ON rdb.key == t2.k;

SELECT
    rdb.key % 2,
    sum(k),
    max(value2)
FROM
    t2
INNER JOIN rdb
    ON rdb.key == t2.k
GROUP BY (rdb.key % 2)
WITH TOTALS;

SELECT *
FROM
    t1
RIGHT JOIN rdb
    ON rdb.key == t1.k;

SELECT *
FROM
    t1
RIGHT JOIN rdb
    ON rdb.key == t1.k
FORMAT Null
SETTINGS join_algorithm = 'direct,hash';

SELECT *
FROM
    t1
FULL JOIN rdb
    ON rdb.key == t1.k;

SELECT *
FROM
    t1
FULL JOIN rdb
    ON rdb.key == t1.k
FORMAT Null
SETTINGS join_algorithm = 'direct,hash';

SELECT *
FROM
    t1
INNER JOIN rdb
    ON rdb.key + 1 == t1.k;

SELECT *
FROM
    t1
INNER JOIN rdb
    ON rdb.key + 1 == t1.k
FORMAT Null
SETTINGS join_algorithm = 'direct,hash';

SELECT *
FROM
    t1
INNER JOIN (
        SELECT *
        FROM rdb
    ) AS rdb
    ON rdb.key == t1.k;

SELECT *
FROM
    t1
INNER JOIN (
        SELECT *
        FROM rdb
    ) AS rdb
    ON rdb.key == t1.k
FORMAT Null
SETTINGS join_algorithm = 'direct,hash';

SELECT *
FROM
    t1
RIGHT JOIN (
        SELECT *
        FROM rdb
    ) AS rdb
    ON rdb.key == t1.k;

SELECT *
FROM
    t1
RIGHT JOIN (
        SELECT *
        FROM rdb
    ) AS rdb
    ON rdb.key == t1.k;