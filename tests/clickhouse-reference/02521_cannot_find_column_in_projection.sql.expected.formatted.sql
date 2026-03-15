CREATE TABLE test
(
    day Date,
    id UInt32
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY day;