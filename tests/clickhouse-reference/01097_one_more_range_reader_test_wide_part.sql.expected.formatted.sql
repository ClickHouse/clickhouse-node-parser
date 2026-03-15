CREATE TABLE t
(
    id UInt32,
    a Int
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 0;

SELECT s
FROM t
PREWHERE a = 1;