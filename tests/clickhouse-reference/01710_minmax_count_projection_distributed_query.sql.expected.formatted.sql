SELECT
    count(),
    count(n),
    count(s)
FROM cluster('test_cluster_two_shards', currentDatabase(), t);