-- Tags: no-fasttest
SYSTEM drop  table if exists test;

SYSTEM drop  table if exists test_cluster;

CREATE TABLE test
(
    json JSON,
    d Dynamic
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO test SELECT
    '{"a" : 42}',
    42::Int64;

CREATE TABLE test_cluster AS cluster(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), 'test');

SELECT *
FROM test_cluster;

SELECT
    json.a,
    d.Int64
FROM test_cluster;

SYSTEM drop  table test_cluster;

SYSTEM drop  table test;