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