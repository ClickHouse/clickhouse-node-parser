CREATE TABLE t1
(
    x Int32
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT *
FROM t1
ORDER BY x ASC;