DROP TABLE IF EXISTS data;

CREATE TABLE data
(
    key Int
)
ENGINE = Memory();

-- NOTE: internal_replication is false, so INSERT will be done only into one shard
INSERT INTO FUNCTION clusterAllReplicas(test_cluster_two_shards, currentDatabase(), data, rand());

SELECT *
FROM data
ORDER BY key ASC;

DROP TABLE data;