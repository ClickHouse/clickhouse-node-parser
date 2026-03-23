CREATE TABLE test
(
    x UInt32,
    y UInt32,
    z UInt32
)
ENGINE = Memory();

INSERT INTO test SELECT *
FROM s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/a.tsv');

SELECT *
FROM test;