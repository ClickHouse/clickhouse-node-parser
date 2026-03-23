-- Tags: log-engine
SYSTEM DROP  TABLE IF EXISTS mergeTree_02184;

CREATE TABLE mergeTree_02184
(
    id UInt64,
    name String,
    dt Date
)
ENGINE = MergeTree
ORDER BY id;

SYSTEM DROP  TABLE IF EXISTS distributed_02184;

CREATE TABLE distributed_02184
(
    id UInt64,
    name String,
    dt Date
)
ENGINE = Distributed('test_cluster_two_shards', 'default', 'mergeTree_02184', rand());

SYSTEM DROP  TABLE IF EXISTS buffer_02184;

CREATE TABLE buffer_02184
(
    id UInt64,
    name String,
    dt Date
)
ENGINE = Buffer(default, mergeTree_02184, 16, 10, 100, 10000, 1000000, 10000000, 100000000);

SYSTEM DROP  TABLE IF EXISTS merge_02184;

CREATE TABLE merge_02184
(
    id UInt64,
    name String,
    dt Date
)
ENGINE = Merge('default', 'distributed_02184');

SYSTEM DROP  TABLE IF EXISTS null_02184;

CREATE TABLE null_02184 AS `system`.one
ENGINE = Null();

SYSTEM DROP  TABLE IF EXISTS file_02184;

CREATE TABLE file_02184
(
    id UInt64,
    name String,
    dt Date
)
ENGINE = File(TabSeparated);

SYSTEM DROP  TABLE IF EXISTS memory_02184;

CREATE TABLE memory_02184
(
    id UInt64,
    name String,
    dt Date
)
ENGINE = Memory();

SYSTEM DROP  TABLE IF EXISTS log_02184;

CREATE TABLE log_02184
(
    id UInt64,
    name String,
    dt Date
)
ENGINE = Log();

SYSTEM DROP  TABLE IF EXISTS ting_log_02184;

CREATE TABLE ting_log_02184
(
    id UInt64,
    name String,
    dt Date
)
ENGINE = TinyLog();

SYSTEM DROP  TABLE IF EXISTS stripe_log_02184;

CREATE TABLE stripe_log_02184
(
    id UInt64,
    name String,
    dt Date
)
ENGINE = StripeLog;