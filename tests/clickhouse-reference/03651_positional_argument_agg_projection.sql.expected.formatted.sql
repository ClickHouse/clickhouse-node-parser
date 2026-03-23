DROP TABLE IF EXISTS test;

CREATE TABLE test
(
    a UInt64,
    b String
)
ENGINE = MergeTree
ORDER BY a;

DROP TABLE test;