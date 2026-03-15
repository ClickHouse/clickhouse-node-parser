CREATE TABLE t1
(
    key UInt64,
    a UInt64
)
ENGINE = Memory;

CREATE TABLE t2
(
    key UInt64,
    a UInt64
)
ENGINE = Join(`ALL`, `RIGHT`, key);

SET enable_analyzer = 0;

SELECT *
FROM
    t1
RIGHT JOIN t2
    USING (key)
ORDER BY key ASC;

SET enable_analyzer = 1;