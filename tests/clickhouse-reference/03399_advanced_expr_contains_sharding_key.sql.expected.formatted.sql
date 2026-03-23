SYSTEM drop  table if exists local_table;

SYSTEM drop  table if exists distributed_table;

SYSTEM drop  table if exists distributed_table2;

SET optimize_skip_unused_shards = true;

SET prefer_localhost_replica = 0;

SET allow_experimental_analyzer = 1;

CREATE TABLE local_table
(
    id UInt64
)
ENGINE = MergeTree
ORDER BY id;

CREATE TABLE distributed_table AS local_table
ENGINE = Distributed(test_cluster_two_shard_three_replicas_localhost, currentDatabase(), local_table, id);

CREATE TABLE distributed_table2 AS local_table
ENGINE = Distributed(test_cluster_two_shard_three_replicas_localhost, currentDatabase(), local_table);

INSERT INTO local_table SELECT number
FROM numbers(100);