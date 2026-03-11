SELECT db1_03101.tbl.col
FROM db1_03101.tbl;

SELECT db1_03101.*
FROM tbl;

SELECT db1_03101
FROM tbl;

SELECT *
FROM tbl;

SELECT count(*)
FROM tbl;

SELECT * + *
FROM VALUES('a UInt16', 1, 10);

SELECT '---';

SELECT *
GROUP BY *;

SELECT *
ORDER BY * ASC;

SELECT *
WHERE *;

SELECT *
FROM
    (
        SELECT 1 AS a
    ) AS t
CROSS JOIN (
        SELECT 2 AS b
    ) AS u;

SELECT
    a,
    b
FROM
    (
        SELECT 1 AS a
    ) AS t
CROSS JOIN (
        SELECT 2 AS b
    ) AS u;

SELECT *
FROM
    (
        SELECT 1 AS a
    ) AS t
CROSS JOIN (
        SELECT 1 AS a
    ) AS u;

SELECT
    t.a,
    u.a
FROM
    (
        SELECT 1 AS a
    ) AS t
CROSS JOIN (
        SELECT 1 AS a
    ) AS u;

SELECT *
FROM t;

SELECT
    x,
    nest.*
FROM t;

SELECT
    x,
    nest.a,
    nest.b
FROM t;