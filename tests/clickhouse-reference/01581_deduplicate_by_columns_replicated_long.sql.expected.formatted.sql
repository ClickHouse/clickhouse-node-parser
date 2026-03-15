SET replication_alter_partitions_sync = 2;

-- IRL insert_replica_id were filled from hostname
CREATE TABLE IF NOT EXISTS replicated_deduplicate_by_columns_r1
(
    id Int32,
    val UInt32,
    unique_value UInt64 MATERIALIZED rowNumberInBlock()
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_01581/replicated_deduplicate', 'r1')
ORDER BY id;

CREATE TABLE IF NOT EXISTS replicated_deduplicate_by_columns_r2
(
    id Int32,
    val UInt32,
    unique_value UInt64 MATERIALIZED rowNumberInBlock()
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_01581/replicated_deduplicate', 'r2')
ORDER BY id;

SELECT
    'r1',
    id,
    val,
    count(),
    uniqExact(unique_value)
FROM replicated_deduplicate_by_columns_r1
GROUP BY
    id,
    val
ORDER BY
    id ASC,
    val ASC;

SELECT
    'r2',
    id,
    val,
    count(),
    uniqExact(unique_value)
FROM replicated_deduplicate_by_columns_r2
GROUP BY
    id,
    val
ORDER BY
    id ASC,
    val ASC;