SYSTEM DROP  TABLE IF EXISTS t0;

SYSTEM DROP  TABLE IF EXISTS t1;

CREATE TABLE t0
(
    x UInt32,
    y UInt64
)
ENGINE = MergeTree
ORDER BY (x, y);

CREATE TABLE t1
(
    x UInt32,
    y UInt64
)
ENGINE = MergeTree
ORDER BY (x, y);

SET join_algorithm = 'partial_merge';

SELECT *
FROM
    t0
LEFT JOIN t1
    ON t1.x = t0.x;

SELECT *
FROM
    t0
INNER JOIN t1
    ON t1.x = t0.x;

SELECT *
FROM
    t0
RIGHT JOIN t1
    ON t1.x = t0.x;

SELECT *
FROM
    t0
FULL JOIN t1
    ON t1.x = t0.x;

SELECT *
FROM
    t0
LEFT JOIN t1
    USING (x);

SELECT *
FROM
    t0
INNER JOIN t1
    USING (x);

SELECT *
FROM
    t0
RIGHT JOIN t1
    USING (x);

SELECT *
FROM
    t0
FULL JOIN t1
    USING (x);

SELECT *
FROM
    t0
LEFT JOIN t1
    ON t1.x = t0.x;

SELECT *
FROM
    t0
INNER JOIN t1
    ON t1.x = t0.x;

SELECT *
FROM
    t0
RIGHT JOIN t1
    ON t1.x = t0.x; -- { serverError NOT_IMPLEMENTED }

SELECT *
FROM
    t0
FULL JOIN t1
    ON t1.x = t0.x; -- { serverError NOT_IMPLEMENTED }

SELECT *
FROM
    t0
LEFT JOIN t1
    USING (x);

SELECT *
FROM
    t0
INNER JOIN t1
    USING (x);

SELECT *
FROM
    t0
RIGHT JOIN t1
    USING (x); -- { serverError NOT_IMPLEMENTED }

SELECT *
FROM
    t0
FULL JOIN t1
    USING (x); -- { serverError NOT_IMPLEMENTED }

SELECT *
FROM
    t0
LEFT JOIN t1
    ON t1.x = t0.x;

SELECT *
FROM
    t0
RIGHT JOIN t1
    ON t1.x = t0.x; -- { serverError NOT_IMPLEMENTED }

SELECT *
FROM
    t0
LEFT JOIN t1
    USING (x);

SELECT *
FROM
    t0
RIGHT JOIN t1
    USING (x); -- { serverError NOT_IMPLEMENTED }

SELECT *
FROM
    t0
LEFT JOIN t1
    ON t1.x = t0.x; -- { serverError NOT_IMPLEMENTED }

SELECT *
FROM
    t0
RIGHT JOIN t1
    ON t1.x = t0.x; -- { serverError NOT_IMPLEMENTED }

SELECT *
FROM
    t0
LEFT JOIN t1
    USING (x); -- { serverError NOT_IMPLEMENTED }

SELECT *
FROM
    t0
RIGHT JOIN t1
    USING (x); -- { serverError NOT_IMPLEMENTED }

SELECT *
FROM
    t0
LEFT JOIN t1
    ON t1.x = t0.x
    AND t0.y > t1.y; -- { serverError NOT_IMPLEMENTED }

SELECT *
FROM
    t0
LEFT JOIN t1
    USING (x, y); -- { serverError NOT_IMPLEMENTED }

SYSTEM DROP  TABLE t0;

SYSTEM DROP  TABLE t1;