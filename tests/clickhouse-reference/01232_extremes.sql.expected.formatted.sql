-- Tags: no-parallel
SET send_logs_level = 'error';

SET extremes = 1;

SELECT *
FROM remote('127.0.0.1', numbers(2));

SELECT *
FROM remote('127.0.0.{1,1}', numbers(2));

SELECT *
FROM remote('127.0.0.{1,2}', numbers(2));

SELECT *
FROM remote('127.0.0.{2,2}', numbers(2));

SELECT *
FROM remote('127.0.0.2', numbers(2));

SELECT '------';

SELECT *
FROM (
        SELECT *
        FROM numbers(2)
        UNION ALL
        SELECT *
        FROM numbers(3)
        UNION ALL
        SELECT *
        FROM numbers(1)
    )
ORDER BY number ASC;

SELECT *
FROM (
        SELECT *
        FROM numbers(1)
        UNION ALL
        SELECT *
        FROM numbers(2)
        UNION ALL
        SELECT *
        FROM numbers(3)
    )
ORDER BY number ASC;

SELECT *
FROM (
        SELECT *
        FROM numbers(3)
        UNION ALL
        SELECT *
        FROM numbers(1)
        UNION ALL
        SELECT *
        FROM numbers(2)
    )
ORDER BY number ASC;

CREATE DATABASE IF NOT EXISTS shard_0;

CREATE DATABASE IF NOT EXISTS shard_1;

SYSTEM drop  table if exists shard_0.num_01232;

SYSTEM drop  table if exists shard_0.num2_01232;

SYSTEM drop  table if exists shard_1.num_01232;

SYSTEM drop  table if exists shard_1.num2_01232;

SYSTEM drop  table if exists distr;

SYSTEM drop  table if exists distr2;

CREATE TABLE shard_0.num_01232
(
    number UInt64
)
ENGINE = MergeTree
ORDER BY number;

CREATE TABLE shard_1.num_01232
(
    number UInt64
)
ENGINE = MergeTree
ORDER BY number;

INSERT INTO shard_0.num_01232 SELECT number
FROM numbers(2);

INSERT INTO shard_1.num_01232 SELECT number
FROM numbers(3);

CREATE TABLE distr
(
    number UInt64
)
ENGINE = Distributed(test_cluster_two_shards_different_databases, '', num_01232);

CREATE TABLE shard_0.num2_01232
(
    number UInt64
)
ENGINE = MergeTree
ORDER BY number;

CREATE TABLE shard_1.num2_01232
(
    number UInt64
)
ENGINE = MergeTree
ORDER BY number;

INSERT INTO shard_0.num2_01232 SELECT number
FROM numbers(3);

INSERT INTO shard_1.num2_01232 SELECT number
FROM numbers(2);

CREATE TABLE distr2
(
    number UInt64
)
ENGINE = Distributed(test_cluster_two_shards_different_databases, '', num2_01232);

SELECT *
FROM distr
ORDER BY number ASC;

SELECT *
FROM distr2
ORDER BY number ASC;

SYSTEM drop  database shard_0;

SYSTEM drop  database shard_1;