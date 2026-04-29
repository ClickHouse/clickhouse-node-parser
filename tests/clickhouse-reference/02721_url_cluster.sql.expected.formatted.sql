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

DESCRIBE TABLE urlCluster('test_cluster_two_shards_localhost', 'http://localhost:11111/test/{a,b,c}.tsv');

DESCRIBE TABLE urlCluster('test_cluster_two_shards_localhost', 'http://localhost:11111/test/{a,b,c}.tsv', 'TSV');

DESCRIBE TABLE urlCluster('test_cluster_two_shards_localhost', 'http://localhost:11111/test/{a,b,c}.tsv', 'TSV', 'c1 UInt64, c2 UInt64, c3 UInt64');

DESCRIBE TABLE urlCluster('test_cluster_two_shards_localhost', 'http://localhost:11111/test/{a,b,c}.tsv', 'TSV', 'c1 UInt64, c2 UInt64, c3 UInt64', 'auto');

SELECT COUNT()
FROM urlCluster('test_cluster_two_shards_localhost', 'http://localhost:11111/test/{a,b,c}.tsv');

SELECT COUNT(*)
FROM urlCluster('test_cluster_two_shards_localhost', 'http://localhost:11111/test/{a,b,c}.tsv');

DESCRIBE TABLE urlCluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv');

DESCRIBE TABLE urlCluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'TSV');

DESCRIBE TABLE urlCluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'auto');

DESCRIBE TABLE urlCluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'TSV', 'auto');

DESCRIBE TABLE urlCluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'TSV', 'auto', 'auto');

DESCRIBE TABLE urlCluster('test_cluster_one_shard_three_replicas_localhost', headers('X-ClickHouse-Database' = 'default'), 'http://localhost:11111/test/{a,b}.tsv');

DESCRIBE TABLE urlCluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', headers('X-ClickHouse-Database' = 'default'), 'TSV');

DESCRIBE TABLE urlCluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'auto', headers('X-ClickHouse-Database' = 'default'));

DESCRIBE TABLE urlCluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'TSV', 'auto', headers('X-ClickHouse-Database' = 'default'));

DESCRIBE TABLE urlCluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'TSV', headers('X-ClickHouse-Database' = 'default'), 'auto', 'auto');

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

DROP TABLE IF EXISTS test;

CREATE TABLE test
(
    x UInt32,
    y UInt32,
    z UInt32
)
ENGINE = Memory();

INSERT INTO test SELECT *
FROM urlCluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/a.tsv', 'TSV');

SELECT *
FROM test;

DROP TABLE test;