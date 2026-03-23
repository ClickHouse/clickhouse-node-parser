-- Tags: distributed
SYSTEM drop  table if exists t;

SYSTEM drop  table if exists td1;

SYSTEM drop  table if exists td2;

SYSTEM drop  table if exists td3;

CREATE TABLE t
(
    val UInt32
)
ENGINE = MergeTree
ORDER BY val;

CREATE TABLE td1 AS t
ENGINE = Distributed(test_shard_localhost, currentDatabase(), 't');

CREATE TABLE td2 AS t
ENGINE = Distributed(test_shard_localhost, currentDatabase(), 't', xxHash32(val), default);

CREATE TABLE td3 AS t
ENGINE = Distributed(test_shard_localhost, currentDatabase(), 't', xxHash32(val), 'default');