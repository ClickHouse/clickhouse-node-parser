-- Tags: no-fasttest
-- Tag no-fasttest: Depends on AWS
SELECT COUNT()
FROM s3Cluster('test_cluster_two_shards_localhost', 'http://localhost:11111/test/{a,b,c}.tsv');

SELECT COUNT(*)
FROM s3Cluster('test_cluster_two_shards_localhost', 'http://localhost:11111/test/{a,b,c}.tsv');