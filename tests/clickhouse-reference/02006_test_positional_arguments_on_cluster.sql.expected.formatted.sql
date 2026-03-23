-- Tags: no-ordinary-database, no-replicated-database, distributed, zookeeper
SYSTEM DROP  TABLE IF EXISTS t02006 on cluster test_shard_localhost format Null;

SYSTEM DROP  TABLE IF EXISTS m02006 on cluster test_shard_localhost format Null;

CREATE TABLE t02006 ON CLUSTER test_shard_localhost
(
    d Date
)
ENGINE = MergeTree
ORDER BY d
FORMAT Null;

CREATE MATERIALIZED VIEW m02006 ON CLUSTER test_shard_localhost
ENGINE = MergeTree
ORDER BY tuple()
AS
SELECT
    d,
    0 AS i
FROM t02006
GROUP BY
    d,
    i
FORMAT Null;

SYSTEM DROP  TABLE IF EXISTS tt02006 on cluster test_shard_localhost format Null;

SET enable_analyzer = 1;

CREATE TABLE t02006 ON CLUSTER test_shard_localhost
(
    a String,
    b UInt32
)
ENGINE = ReplicatedMergeTree
PRIMARY KEY a
ORDER BY a
FORMAT Null;

CREATE TABLE tt02006 ON CLUSTER test_shard_localhost
(
    a String,
    total SimpleAggregateFunction(sum, UInt64)
)
ENGINE = ReplicatedAggregatingMergeTree
ORDER BY a
FORMAT Null;

CREATE MATERIALIZED VIEW m02006 ON CLUSTER test_shard_localhost
TO tt02006
AS
SELECT
    a,
    sum(b) AS total
FROM t02006
GROUP BY 1
ORDER BY 1 ASC
FORMAT Null;