-- Tags: shard, no-parallel
CREATE DATABASE IF NOT EXISTS shard_0;

CREATE DATABASE IF NOT EXISTS shard_1;

CREATE TABLE shard_0.tbl
(
    number UInt64
)
ENGINE = MergeTree
ORDER BY number;

CREATE TABLE shard_1.tbl
(
    number UInt64
)
ENGINE = MergeTree
ORDER BY number;

CREATE TABLE distr
(
    number UInt64
)
ENGINE = Distributed(test_cluster_two_shards_different_databases, '', tbl);

SET distributed_foreground_insert = 1;

SET insert_distributed_one_random_shard = 1;

SET max_block_size = 1;

SET max_insert_block_size = 1;

SET min_insert_block_size_rows = 1;

SELECT count() != 0
FROM shard_0.tbl;

SELECT count() != 0
FROM shard_1.tbl;

SELECT *
FROM distr
ORDER BY number ASC
LIMIT 20;