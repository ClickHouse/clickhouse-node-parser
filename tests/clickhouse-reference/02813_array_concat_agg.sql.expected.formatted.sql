CREATE TABLE t
(
    n UInt32,
    a Array(Int32)
)
ENGINE = Memory;

SELECT array_concat_agg(a)
FROM t;

SELECT
    n,
    array_concat_agg(a)
FROM t
GROUP BY n
ORDER BY n ASC;