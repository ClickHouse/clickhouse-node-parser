CREATE TABLE test
(
    a UInt64,
    b UInt64
)
ENGINE = MergeTree
ORDER BY tuple();