SELECT number
FROM cluster(test_cluster_two_shards_localhost, numbers(1))
WHERE number GLOBAL IN (tuple(0, 1, 2, 3));

SELECT number
FROM cluster(test_cluster_two_shards_localhost, numbers(1))
WHERE number GLOBAL IN (array(0, 1, 2, 3));