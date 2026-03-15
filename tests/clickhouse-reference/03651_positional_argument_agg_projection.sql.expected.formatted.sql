CREATE TABLE test
(
    a UInt64,
    b String
)
ENGINE = MergeTree
ORDER BY a;