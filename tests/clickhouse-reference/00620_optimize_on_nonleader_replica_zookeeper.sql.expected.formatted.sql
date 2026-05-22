-- Tags: replica, no-replicated-database
-- Tag no-replicated-database: Fails due to additional replicas or shards
-- The test is mostly outdated as now every replica is leader and can do OPTIMIZE locally.
DROP TABLE IF EXISTS rename1;

DROP TABLE IF EXISTS rename2;

DROP TABLE IF EXISTS rename3;

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

SYSTEM SYNC REPLICA rename1 PULL; -- Avoid "Cannot select parts for optimization: Entry for part 0_1_1_0 hasn't been read from the replication log yet"

SYSTEM SYNC REPLICA rename2;

OPTIMIZE TABLE rename1 FINAL;

OPTIMIZE TABLE rename2 FINAL;

SELECT *
FROM rename1;

RENAME TABLE rename2 TO rename3;

INSERT INTO rename1;

SYSTEM SYNC REPLICA rename3; -- Make "rename3" to see all data parts.

OPTIMIZE TABLE rename3;

SYSTEM SYNC REPLICA rename1; -- Make "rename1" to see and process all scheduled merges.