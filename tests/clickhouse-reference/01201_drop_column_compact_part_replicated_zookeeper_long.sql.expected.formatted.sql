-- Tags: long, replica
-- in case of keeper fault injection on insert, set bigger number of retries because partitions
SET insert_keeper_max_retries = 100;

SET insert_keeper_retry_max_backoff_ms = 10;

-- Testing basic functionality with compact parts
SET replication_alter_partitions_sync = 2;

CREATE TABLE mt_compact
(
    a UInt64,
    b UInt64 DEFAULT a * a,
    s String,
    n Nested(x UInt32, y String),
    lc LowCardinality(String)
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test_01201/mt_compact_replicated', '1')
ORDER BY a
PARTITION BY a % 10
SETTINGS index_granularity = 8, min_rows_for_wide_part = 10;

SELECT *
FROM mt_compact
ORDER BY
    a ASC,
    s ASC
LIMIT 10;

SELECT *
FROM mt_compact
WHERE a > 1
ORDER BY
    a ASC,
    s ASC
LIMIT 10;