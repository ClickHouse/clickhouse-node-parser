CREATE TABLE test
(
    col1 Int64,
    dt Date
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY dt;