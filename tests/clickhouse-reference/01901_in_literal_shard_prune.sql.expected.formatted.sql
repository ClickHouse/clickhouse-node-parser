-- Tags: shard
SET optimize_skip_unused_shards = 1;

SET force_optimize_skip_unused_shards = 1;

CREATE TABLE d
(
    i UInt8
)
ENGINE = Memory;

CREATE TABLE dp AS d
ENGINE = Distributed(test_cluster_two_shards, currentDatabase(), d, i);

SELECT *
FROM dp
WHERE i IN (1);