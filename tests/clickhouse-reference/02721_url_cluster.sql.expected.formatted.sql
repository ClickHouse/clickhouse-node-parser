-- Tags: no-fasttest
-- Tag no-fasttest: Depends on AWS
SELECT *
FROM urlCluster('test_cluster_two_shards_localhost', 'http://localhost:11111/test/{a,b,c}.tsv')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM urlCluster('test_cluster_two_shards_localhost', 'http://localhost:11111/test/{a,b,c}.tsv', 'TSV')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM urlCluster('test_cluster_two_shards_localhost', 'http://localhost:11111/test/{a,b,c}.tsv', 'TSV', 'c1 UInt64, c2 UInt64, c3 UInt64')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM urlCluster('test_cluster_two_shards_localhost', 'http://localhost:11111/test/{a,b,c}.tsv', 'TSV', 'c1 UInt64, c2 UInt64, c3 UInt64', 'auto')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT COUNT()
FROM urlCluster('test_cluster_two_shards_localhost', 'http://localhost:11111/test/{a,b,c}.tsv');

SELECT COUNT(*)
FROM urlCluster('test_cluster_two_shards_localhost', 'http://localhost:11111/test/{a,b,c}.tsv');

SELECT *
FROM urlCluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM urlCluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'TSV')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM urlCluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'auto')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM urlCluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'TSV', 'auto')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM urlCluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'TSV', 'auto', 'auto')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM test;