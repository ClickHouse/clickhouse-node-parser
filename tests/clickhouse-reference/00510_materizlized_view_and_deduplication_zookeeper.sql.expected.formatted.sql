SET database_replicated_allow_explicit_uuid = 3;

SET database_replicated_allow_replicated_engine_arguments = 3;

CREATE TABLE with_deduplication
(
    x UInt32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00510/with_deduplication', 'r1')
ORDER BY x;

CREATE TABLE without_deduplication
(
    x UInt32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00510/without_deduplication', 'r1')
ORDER BY x
SETTINGS replicated_deduplication_window = 0, replicated_deduplication_window_for_async_inserts = 0;

CREATE MATERIALIZED VIEW with_deduplication_mv
ENGINE = ReplicatedAggregatingMergeTree('/clickhouse/tables/{database}/test_00510/with_deduplication_mv', 'r1')
ORDER BY dummy
AS
SELECT
    0 AS dummy,
    countState(x) AS cnt
FROM with_deduplication;

CREATE MATERIALIZED VIEW without_deduplication_mv
ENGINE = ReplicatedAggregatingMergeTree('/clickhouse/tables/{database}/test_00510/without_deduplication_mv', 'r1')
ORDER BY dummy
AS
SELECT
    0 AS dummy,
    countState(x) AS cnt
FROM without_deduplication;

SELECT count()
FROM with_deduplication;

SELECT count()
FROM without_deduplication;

SELECT countMerge(cnt)
FROM with_deduplication_mv;

SELECT countMerge(cnt)
FROM without_deduplication_mv;