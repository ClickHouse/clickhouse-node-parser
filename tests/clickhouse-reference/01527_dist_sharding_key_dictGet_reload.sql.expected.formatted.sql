-- Tags: shard, no-parallel
SET allow_nondeterministic_optimize_skip_unused_shards = 1;

SET optimize_skip_unused_shards = 1;

SET force_optimize_skip_unused_shards = 2;

SET check_table_dependencies = 0;

SYSTEM drop  database if exists db_01527_ranges;

SYSTEM drop  table if exists dist_01527;

SYSTEM drop  table if exists data_01527;

CREATE DATABASE db_01527_ranges;

CREATE TABLE data_01527
ENGINE = Memory() AS
SELECT toUInt64(number) AS key
FROM numbers(2);

CREATE TABLE dist_01527 AS data_01527
ENGINE = Distributed('test_cluster_two_shards', currentDatabase(), data_01527, dictGetUInt64('db_01527_ranges.dict', 'shard', key));

CREATE TABLE db_01527_ranges.data
ENGINE = Memory() AS
SELECT
    number AS key,
    number AS shard
FROM numbers(100);

CREATE DICTIONARY db_01527_ranges.dict
(
    key UInt64,
    shard UInt64
)
PRIMARY KEY key
SOURCE(clickhouse(host '127.0.0.1' port tcpPort() table 'data' db 'db_01527_ranges' user 'default' password ''))
LIFETIME(0)
LAYOUT(HASHED());

SELECT _shard_num
FROM dist_01527
WHERE key = 0;

SELECT _shard_num
FROM dist_01527
WHERE key = 1;

SYSTEM drop  table db_01527_ranges.data sync;

CREATE TABLE db_01527_ranges.data
ENGINE = Memory() AS
SELECT
    number AS key,
    number + 1 AS shard
FROM numbers(100);

SYSTEM drop  table data_01527;

SYSTEM drop  table dist_01527;

SYSTEM drop  table db_01527_ranges.data;

SYSTEM drop  dictionary db_01527_ranges.dict;

SYSTEM drop  database db_01527_ranges;