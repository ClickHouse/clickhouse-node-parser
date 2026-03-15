CREATE TABLE data_01292
(
    key Int,
    INDEX key_idx (key) TYPE minmax GRANULARITY 1
)
ENGINE = MergeTree()
ORDER BY key + 0;

SELECT *
FROM data_01292
WHERE key > 0;