CREATE TABLE table1(x UInt32) ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test_03779/table', '1') ORDER BY x;
CREATE TABLE table2(x UInt32) ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test_03779/table', '2') ORDER BY x;
set insert_quorum=2;
set async_insert = 1;
set wait_for_async_insert = 0;
set async_insert_deduplicate = 1;
set wait_for_async_insert_timeout = 10000, async_insert_max_query_number = 1000, async_insert_max_data_size = 10000000, async_insert_use_adaptive_busy_timeout = 0;
set insert_quorum_parallel=0;
set insert_quorum_parallel=1;
SELECT 'q1', x FROM table1 ORDER BY all;
SELECT 'q2', x FROM table2 ORDER BY all;
SELECT
    query,
    query_kind,
    ProfileEvents['QuorumParts'] AS quorum_parts,
    ProfileEvents['QuorumWaitMicroseconds'] > 0 AS quorum_wait_microseconds_non_zero,
    ProfileEvents['QuorumFailedInserts'] AS quorum_failed_inserts
FROM system.query_log
WHERE
    type = 'QueryFinish'
    AND query_kind = 'System'
    AND has(databases, current_database())
    AND has(tables, current_database() || '.table2')
ORDER BY event_time DESC FORMAT Vertical;
set wait_for_async_insert=1, insert_quorum_timeout=1;
