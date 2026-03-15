CREATE TABLE test
(
    a Array(UInt64),
    `a.size0` UInt64
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 1;

SELECT a.size0
FROM test;

SELECT
    a,
    a.size0
FROM test;