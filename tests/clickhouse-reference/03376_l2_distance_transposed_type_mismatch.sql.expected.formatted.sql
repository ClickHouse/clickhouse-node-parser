-- Tags: no-parallel-replicas
-- No parallel replicas because: https://github.com/ClickHouse/ClickHouse/issues/74367
-- https://github.com/ClickHouse/ClickHouse/issues/89976
-- Check whether the distance is calculated correctly when query_vec has a different type than qbit
SYSTEM DROP  TABLE IF EXISTS test;

CREATE TABLE test
(
    id UInt32,
    qbit QBit(Float32, 16)
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO test;

SYSTEM DROP  TABLE test;