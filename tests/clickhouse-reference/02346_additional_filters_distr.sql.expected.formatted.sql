-- Tags: no-parallel, distributed
CREATE DATABASE IF NOT EXISTS shard_0;

CREATE DATABASE IF NOT EXISTS shard_1;

SYSTEM drop  table if exists dist_02346;

SYSTEM drop  table if exists shard_0.data_02346;

SYSTEM drop  table if exists shard_1.data_02346;

CREATE TABLE shard_0.data_02346
(
    x UInt32,
    y String
)
ENGINE = MergeTree
ORDER BY x
SETTINGS index_granularity = 2;

INSERT INTO shard_0.data_02346;

CREATE TABLE shard_1.data_02346
(
    x UInt32,
    y String
)
ENGINE = MergeTree
ORDER BY x
SETTINGS index_granularity = 2;

INSERT INTO shard_1.data_02346;

CREATE TABLE dist_02346
(
    x UInt32,
    y String
)
ENGINE = Distributed('test_cluster_two_shards_different_databases', '', data_02346);

SET max_rows_to_read = 4;

SELECT *
FROM dist_02346
ORDER BY x ASC
SETTINGS additional_table_filters = map('dist_02346', 'x > 3 and x < 7');