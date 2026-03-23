-- Tags: no-parallel
CREATE DATABASE IF NOT EXISTS shard_0;

CREATE DATABASE IF NOT EXISTS shard_1;

SYSTEM drop  table if exists dist_01850;

SYSTEM drop  table if exists shard_0.data_01850;

CREATE TABLE shard_0.data_01850
(
    key Int
)
ENGINE = Memory();

CREATE TABLE dist_01850
(
    key Int
)
ENGINE = Distributed('test_cluster_two_replicas_different_databases', '', data_01850, key);

SET distributed_foreground_insert = 1;

SET prefer_localhost_replica = 0;

INSERT INTO dist_01850; -- { serverError UNKNOWN_TABLE }

SYSTEM drop  table shard_0.data_01850;

SYSTEM drop  database shard_0;

SYSTEM drop  database shard_1;