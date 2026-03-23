SYSTEM drop  table if exists data_01072;

SYSTEM drop  table if exists dist_01072;

CREATE TABLE data_01072
(
    key Int
)
ENGINE = MergeTree()
ORDER BY key;

CREATE TABLE dist_01072
(
    key Int
)
ENGINE = Distributed(test_cluster_two_shards, currentDatabase(), data_01072, key);

SELECT *
FROM dist_01072
WHERE key = 0
    AND _part = '0';