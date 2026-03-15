CREATE TABLE data_01593
(
    key Int
)
ENGINE = MergeTree()
ORDER BY key
PARTITION BY key;