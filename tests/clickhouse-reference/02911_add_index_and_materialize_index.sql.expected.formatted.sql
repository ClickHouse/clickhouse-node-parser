CREATE TABLE index_test
(
    x UInt32,
    y UInt32,
    z UInt32
)
ENGINE = MergeTree
ORDER BY x;