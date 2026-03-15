CREATE TABLE t
(
    key1 UInt64,
    value1 String,
    value2 String,
    INDEX idx value1 TYPE set(10) GRANULARITY 1
)
ENGINE = MergeTree
ORDER BY key1
SETTINGS index_granularity = 1;

SET alter_sync = 0;

-- Index works without mutation applied.
SELECT *
FROM t
WHERE value11 = '000'
SETTINGS max_rows_to_read = 0;

-- Index works with mutation applied.
SELECT *
FROM t
WHERE value12 = '000'
SETTINGS max_rows_to_read = 0;