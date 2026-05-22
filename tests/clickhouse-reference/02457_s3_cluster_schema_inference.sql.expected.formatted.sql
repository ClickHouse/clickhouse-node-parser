-- Tags: no-fasttest
-- Tag no-fasttest: Depends on AWS
DESCRIBE TABLE s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv');

DESCRIBE TABLE s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'TSV');

DESCRIBE TABLE s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'test', 'testtest');

DESCRIBE TABLE s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'test', 'testtest', 'TSV');

DESCRIBE TABLE s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'auto');

DESCRIBE TABLE s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'TSV', 'auto');

DESCRIBE TABLE s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'TSV', 'auto', 'auto');

DESCRIBE TABLE s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'test', 'testtest', 'auto');

DESCRIBE TABLE s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'test', 'testtest', 'TSV', 'auto');

DESCRIBE TABLE s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'test', 'testtest', 'TSV', 'auto', 'auto');

DESCRIBE TABLE s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', NOSIGN);

DESCRIBE TABLE s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', NOSIGN, 'TSV');

DESCRIBE TABLE s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', NOSIGN, 'TSV', 'auto');

DESCRIBE TABLE s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', NOSIGN, 'TSV', 'auto', 'auto');

DESCRIBE TABLE s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', headers(MyCustomHeader = 'SomeValue'));

DESCRIBE TABLE s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'TSV', 'auto', headers(MyCustomHeader = 'SomeValue'), 'auto');

SELECT *
FROM s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'TSV')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'test', 'testtest')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'test', 'testtest', 'TSV')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'auto')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'TSV', 'auto')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'TSV', 'auto', 'auto')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'test', 'testtest', 'auto')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'test', 'testtest', 'TSV', 'auto')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'test', 'testtest', 'TSV', 'auto', 'auto')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', NOSIGN)
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', NOSIGN, 'TSV')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', NOSIGN, 'TSV', 'auto')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', NOSIGN, 'TSV', 'auto', 'auto')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', headers(MyCustomHeader = 'SomeValue'))
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;

SELECT *
FROM s3Cluster('test_cluster_one_shard_three_replicas_localhost', 'http://localhost:11111/test/{a,b}.tsv', 'TSV', 'auto', headers(MyCustomHeader = 'SomeValue'), 'auto')
ORDER BY
    c1 ASC,
    c2 ASC,
    c3 ASC;