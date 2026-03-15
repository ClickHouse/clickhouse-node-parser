-- Tags: shard
SET optimize_skip_unused_shards = 1;

CREATE TABLE data_01755
(
    i Int
)
ENGINE = Memory;

CREATE TABLE dist_01755 AS data_01755
ENGINE = Distributed(test_cluster_two_shards, currentDatabase(), data_01755, i);

SELECT *
FROM dist_01755
WHERE 1
SETTINGS enable_early_constant_folding = 0;