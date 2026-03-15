CREATE TABLE test
(
    json JSON,
    d Dynamic
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE test_cluster AS cluster(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), 'test');

SELECT *
FROM test_cluster;

SELECT
    json.a,
    d.Int64
FROM test_cluster;