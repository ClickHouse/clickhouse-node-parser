-- Tags: no-replicated-database
SYSTEM DROP  TABLE IF EXISTS index_test;

CREATE TABLE index_test
(
    x UInt32,
    y UInt32,
    z UInt32
)
ENGINE = MergeTree
ORDER BY x;

SYSTEM drop  table index_test;