SET max_bytes_in_join = 0, join_algorithm = 'full_sorting_merge', max_block_size = 10240;

CREATE TABLE t1
(
    key UInt32,
    s String
)
ENGINE = MergeTree
ORDER BY key;

CREATE TABLE t2
(
    key UInt32,
    s String
)
ENGINE = MergeTree
ORDER BY key;

SELECT
    materialize([NULL]),
    [],
    100,
    count(materialize(NULL))
FROM
    t1
INNER JOIN t2
    ON t1.key = t2.key
PREWHERE 10
WHERE t2.key != 0
WITH TOTALS;