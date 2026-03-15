CREATE DATABASE `02028_db` ON CLUSTER test_shard_localhost;

USE 02028_db;

CREATE TABLE t1_local ON CLUSTER test_shard_localhost
(
    partition_col_1 String,
    tc1 int,
    tc2 int
)
ENGINE = MergeTree()
ORDER BY tc1
PARTITION BY partition_col_1;

CREATE TABLE t2_local ON CLUSTER test_shard_localhost
(
    partition_col_1 String,
    tc1 int,
    tc2 int
)
ENGINE = MergeTree()
ORDER BY tc1
PARTITION BY partition_col_1;