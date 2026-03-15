SET enable_analyzer = 1;

CREATE TABLE t1
(
    x Nullable(Int32),
    y Nullable(Int32)
)
ENGINE = Memory;

CREATE TABLE t2
(
    x Nullable(Int32),
    y Nullable(Int32)
)
ENGINE = Memory;

SELECT e2
FROM
    t1
FULL JOIN t2
    ON (((((t1.y = t2.y)
    OR ((isNull(t1.y))
    AND (isNull(t2.y)))))
    AND (COALESCE(t1.x, 0) != 2))
    OR ((t1.x = t2.x)
    AND (((isNotNull(t2.x))
    AND (isNotNull(t1.x))))) AS e2)
ORDER BY `ALL` ASC;

SELECT
    *,
    e2
FROM
    t1
FULL JOIN t2
    ON ((((((t1.y = t2.y)
    OR ((isNull(t1.y))
    AND (isNull(t2.y)))))
    AND (COALESCE(t1.x, 0) != 2))
    OR ((t1.x = t2.x)
    AND (((isNotNull(t2.x))
    AND (isNotNull(t1.x))))) AS e2))
    AND (t1.x = 1)
    AND (t2.x = 1)
ORDER BY `ALL` ASC;