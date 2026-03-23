CREATE TABLE t1
(
    x Nullable(Int64),
    y Nullable(UInt64)
)
ENGINE = TinyLog;

CREATE TABLE t2
(
    x Nullable(Int64),
    y Nullable(UInt64)
)
ENGINE = TinyLog;

INSERT INTO t1;

INSERT INTO t2;

CREATE TABLE t1n
(
    x Int64,
    y UInt64
)
ENGINE = TinyLog;

CREATE TABLE t2n
(
    x Int64,
    y UInt64
)
ENGINE = TinyLog;

INSERT INTO t1n;

INSERT INTO t2n;

SET enable_analyzer = 1;

-- { echoOn }
SELECT *
FROM
    t1
INNER JOIN t2
    ON (t1.x <=> t2.x
    OR (isNull(t1.x)
    AND isNull(t2.x)))
ORDER BY t1.x ASC;

SELECT *
FROM
    t1
INNER JOIN t2
    ON ((t1.x <=> t2.x
    OR isNull(t1.x)
    AND isNull(t2.x)))
    OR t1.y <=> t2.y
ORDER BY t1.x ASC;

SELECT *
FROM
    t1
INNER JOIN t2
    ON (t1.x = t2.x
    OR isNull(t1.x)
    AND isNull(t2.x))
ORDER BY t1.x ASC;

SELECT *
FROM
    t1
INNER JOIN t2
    ON t1.x <=> t2.x
    AND (((t1.x = t1.y)
    OR isNull(t1.x)
    AND isNull(t1.y)))
ORDER BY t1.x ASC;

SELECT *
FROM
    t1
INNER JOIN t2
    ON ((t1.x = t2.x
    OR isNull(t1.x)
    AND isNull(t2.x)))
    AND t1.y <=> t2.y
ORDER BY t1.x ASC;

SELECT *
FROM
    t1
INNER JOIN t2
    ON (t1.x <=> t2.x
    OR t1.y <=> t2.y
    OR (isNull(t1.x)
    AND isNull(t2.x))
    OR (isNull(t1.y)
    AND isNull(t2.y)))
ORDER BY t1.x ASC;

SELECT *
FROM
    t1
INNER JOIN t2
    ON ((t1.x <=> t2.x
    OR (isNull(t1.x)
    AND isNull(t2.x))))
    AND ((t1.y == t2.y
    OR (isNull(t1.y)
    AND isNull(t2.y))))
    AND COALESCE(t1.x, 0) != 2
ORDER BY t1.x ASC;

SELECT x = y
    OR (isNull(x)
    AND isNull(y))
FROM t1
ORDER BY x ASC;

SELECT *
FROM
    t1
INNER JOIN t2
    ON (t1.x == t2.x
    AND (((isNotNull(t2.x))
    AND (isNotNull(t1.x)))))
    OR ((isNull(t2.x))
    AND (isNull(t1.x)))
ORDER BY t1.x ASC;

SELECT *
FROM
    t1
INNER JOIN t2
    ON (t1.x == t2.x
    AND (((isNotNull(t2.x))
    AND (isNotNull(t1.x)))))
    OR (t2.x <> t1.x
    AND (isNull(t2.x))
    AND (isNull(t1.x)))
ORDER BY t1.x ASC;

SELECT *
FROM
    t1
INNER JOIN t2
    ON (t1.x == t2.x
    AND (((isNotNull(t2.x))
    AND (isNotNull(t1.x)))))
    OR (t2.x <> t1.x
    AND t2.x <> t1.x)
ORDER BY `ALL` ASC
SETTINGS query_plan_use_new_logical_join_step = 0;

SELECT *
FROM
    t1
INNER JOIN t2
    ON (t1.x == t2.x
    AND (((isNotNull(t2.x))
    AND (isNotNull(t1.x)))))
    OR (t2.x <> t1.x
    AND (isNull(t2.x))
    AND (isNull(t2.x)))
ORDER BY t1.x ASC
SETTINGS
    query_plan_use_new_logical_join_step = 0,
    use_join_disjunctions_push_down = 0;

-- aliases defined in the join condition are valid
SELECT
    *,
    e,
    e2
FROM
    t1
FULL JOIN t2
    ON (((((t1.x == t2.x) AS e))
    AND (((isNotNull(t2.x))
    AND (isNotNull(t1.x)))))
    OR ((isNull(t2.x))
    AND (isNull(t1.x))) AS e2)
ORDER BY
    t1.x ASC,
    t2.x ASC;

SELECT
    *,
    e,
    e2
FROM
    t1
FULL JOIN t2
    ON (((((t1.x == t2.x) AS e))
    AND (((isNotNull(t2.x))
    AND (isNotNull(t1.x))))) AS e2)
ORDER BY
    t1.x ASC,
    t2.x ASC;

-- check for non-nullable columns for which `is null` is replaced with constant
SELECT *
FROM
    t1n AS t1
INNER JOIN t2n AS t2
    ON (t1.x == t2.x
    AND (((isNotNull(t2.x))
    AND (isNotNull(t1.x)))))
    OR ((isNull(t2.x))
    AND (isNull(t1.x)))
ORDER BY t1.x ASC;

-- { echoOff }
SELECT '--';

-- IS NOT NULL and constants are optimized out
SELECT count()
FROM (
        EXPLAIN QUERY TREE
        SELECT *
        FROM
            t1
        INNER JOIN t2
            ON ((t1.x = t2.x)
            AND (isNotNull(t1.x))
            AND true
            AND (isNotNull(t2.x)))
    )
WHERE like(`explain`, '%CONSTANT%')
    OR ilike(`explain`, '%is%null%');

SELECT count()
FROM (
        EXPLAIN QUERY TREE
        SELECT *
        FROM
            t1
        INNER JOIN t2
            ON ((t1.x = t2.x)
            AND true)
    )
WHERE like(`explain`, '%CONSTANT%')
    OR ilike(`explain`, '%is%null%');

-- this is not optimized out
SELECT count()
FROM (
        EXPLAIN QUERY TREE
        SELECT *
        FROM
            t1
        INNER JOIN t2
            ON (t1.x <=> t2.x
            OR isNull(t1.x)
            AND t1.y <=> t2.y
            AND isNull(t2.x))
    )
WHERE like(`explain`, '%CONSTANT%')
    OR ilike(`explain`, '%is%null%');

SELECT count()
FROM (
        EXPLAIN QUERY TREE
        SELECT *
        FROM
            t1
        INNER JOIN t2
            ON t1.x <=> t2.x
            AND ((t1.x = t1.y
            OR isNull(t1.x)
            AND isNull(t1.y)))
    )
WHERE like(`explain`, '%CONSTANT%')
    OR ilike(`explain`, '%is%null%');

SELECT count()
FROM (
        EXPLAIN QUERY TREE
        SELECT *
        FROM
            t1
        INNER JOIN t2
            ON t1.x = t2.x
            AND NOT(t1.x = 1
            OR isNull(t1.x))
    )
WHERE ilike(`explain`, '%function_name: isNull%');