-- Tags: replica, no-replicated-database
-- Tag no-replicated-database: Fails due to additional replicas or shards
-- The test is mostly outdated as now every replica is leader and can do OPTIMIZE locally.
SYSTEM DROP  TABLE IF EXISTS rename1;

SYSTEM DROP  TABLE IF EXISTS rename2;

SYSTEM DROP  TABLE IF EXISTS rename3;

CREATE TABLE rename1
(
    p Int64,
    i Int64,
    v UInt64
)
ENGINE = ReplicatedReplacingMergeTree('/clickhouse/tables/{database}/rename', '1', v)
ORDER BY i
PARTITION BY p;

CREATE TABLE rename2
(
    p Int64,
    i Int64,
    v UInt64
)
ENGINE = ReplicatedReplacingMergeTree('/clickhouse/tables/{database}/rename', '2', v)
ORDER BY i
PARTITION BY p;

INSERT INTO rename1;

INSERT INTO rename1;

SELECT *
FROM rename1;

INSERT INTO rename1;