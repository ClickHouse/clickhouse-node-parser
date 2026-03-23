-- Tags: no-replicated-database
DROP TABLE IF EXISTS index_test;

CREATE TABLE index_test
(
    x UInt32,
    y UInt32,
    z UInt32
)
ENGINE = MergeTree
ORDER BY x;

DROP TABLE index_test;