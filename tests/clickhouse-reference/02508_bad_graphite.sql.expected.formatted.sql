SYSTEM DROP  TABLE IF EXISTS test_graphite;

CREATE TABLE test_graphite
(
    key UInt32,
    Path String,
    Time DateTime('UTC'),
    Value UInt8,
    Version UInt32,
    col UInt64
)
ENGINE = GraphiteMergeTree('graphite_rollup')
ORDER BY key;

INSERT INTO test_graphite (key); -- { serverError BAD_ARGUMENTS }

SYSTEM DROP  TABLE test_graphite;