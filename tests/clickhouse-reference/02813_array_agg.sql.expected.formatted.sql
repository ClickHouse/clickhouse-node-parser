CREATE TABLE t
(
    n Int32,
    s String
)
ENGINE = MergeTree
ORDER BY n;

SELECT array_agg(s)
FROM t;

SELECT aRray_Agg(s)
FROM t
GROUP BY n;