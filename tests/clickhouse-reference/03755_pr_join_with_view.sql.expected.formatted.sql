DROP TABLE IF EXISTS v;

DROP TABLE IF EXISTS t0;

DROP TABLE IF EXISTS t1;

CREATE TABLE t0
(
    k UInt64,
    v String
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/t0', '0')
ORDER BY tuple();

CREATE TABLE t1
(
    k UInt64,
    v String
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/t1', '0')
ORDER BY tuple();

CREATE VIEW v
AS
SELECT *
FROM t0;

INSERT INTO t0 SELECT
    number,
    toString(number)
FROM numbers(10);

INSERT INTO t1 SELECT
    number,
    toString(number + 100)
FROM numbers(10);

SET enable_parallel_replicas = 1, max_parallel_replicas = 3, cluster_for_parallel_replicas = 'test_cluster_one_shard_three_replicas_localhost';