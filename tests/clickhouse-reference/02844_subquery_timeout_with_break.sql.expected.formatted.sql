CREATE TABLE t
(
    key UInt64,
    value UInt64,
    INDEX value_idx value TYPE bloom_filter GRANULARITY 1
)
ENGINE = MergeTree()
ORDER BY key;

SET timeout_overflow_mode = 'break';

SET max_execution_time = 0.1, max_rows_to_read = 0;

SELECT *
FROM t
WHERE value IN (
        SELECT number
        FROM numbers(1000000000)
    );