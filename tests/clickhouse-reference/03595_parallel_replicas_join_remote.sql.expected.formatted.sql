SELECT '---';

SELECT count()
FROM
    test_join_remote_l AS x
INNER JOIN cluster(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), test_join_remote_r) AS y
    ON true;

SELECT count()
FROM
    test_join_remote_l AS x
INNER JOIN clusterAllReplicas(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), test_join_remote_r) AS y
    ON true;

SELECT count()
FROM
    test_join_remote_l AS x
INNER JOIN remote(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), test_join_remote_r) AS y
    ON true;

SELECT count()
FROM
    test_join_remote_l AS x
INNER JOIN remoteSecure(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), test_join_remote_r) AS y
    ON true;

SELECT count()
FROM
    test_join_remote_l AS x
RIGHT JOIN cluster(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), test_join_remote_r) AS y
    ON true;

SELECT count()
FROM
    test_join_remote_l AS x
RIGHT JOIN clusterAllReplicas(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), test_join_remote_r) AS y
    ON true;

SELECT count()
FROM
    test_join_remote_l AS x
RIGHT JOIN remote(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), test_join_remote_r) AS y
    ON true;

SELECT count()
FROM
    test_join_remote_l AS x
RIGHT JOIN remoteSecure(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), test_join_remote_r) AS y
    ON true;

SELECT count()
FROM
    cluster(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), test_join_remote_l) AS x
INNER JOIN test_join_remote_r AS y
    ON true;

SELECT count()
FROM
    clusterAllReplicas(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), test_join_remote_l) AS x
INNER JOIN test_join_remote_r AS y
    ON true;

SELECT count()
FROM
    remote(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), test_join_remote_l) AS x
INNER JOIN test_join_remote_r AS y
    ON true;

SELECT count()
FROM
    remoteSecure(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), test_join_remote_l) AS x
INNER JOIN test_join_remote_r AS y
    ON true;

SELECT count()
FROM
    cluster(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), test_join_remote_l) AS x
RIGHT JOIN test_join_remote_r AS y
    ON true;

SELECT count()
FROM
    clusterAllReplicas(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), test_join_remote_l) AS x
RIGHT JOIN test_join_remote_r AS y
    ON true;

SELECT count()
FROM
    remote(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), test_join_remote_l) AS x
RIGHT JOIN test_join_remote_r AS y
    ON true;

SELECT count()
FROM
    remoteSecure(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), test_join_remote_l) AS x
RIGHT JOIN test_join_remote_r AS y
    ON true;