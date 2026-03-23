CREATE TABLE t
(
    id UInt32,
    a Int
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 0;

INSERT INTO t;

SELECT s
FROM t
PREWHERE a = 1;

INSERT INTO t;