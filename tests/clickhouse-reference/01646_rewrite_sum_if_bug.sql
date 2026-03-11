SELECT round((sum(multiIf(s IN ('a', 'b'), 1, 0)) / count()) * 100) AS r
FROM cluster('test_cluster_two_shards', currentDatabase(), t);
