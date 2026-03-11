select count(), count(n), count(s) from cluster('test_cluster_two_shards', currentDatabase(), t);
