CREATE TABLE kv
(
    `key` UInt64,
    `value` UInt64,
    `s` String,
    INDEX value_idx value TYPE minmax GRANULARITY 1
)
ENGINE = ReplacingMergeTree
ORDER BY key
SETTINGS index_granularity = 32, index_granularity_bytes = 1024;
INSERT INTO kv SELECT
    number,
    number + 100,
    toString(number)
FROM numbers(2048);
SELECT *
FROM kv
WHERE value = 442;
