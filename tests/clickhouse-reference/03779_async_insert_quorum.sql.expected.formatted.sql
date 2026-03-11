SELECT
    'q1',
    x
FROM table1
ORDER BY `all` ASC;

SELECT
    'q2',
    x
FROM table2
ORDER BY `all` ASC;

SELECT
    query,
    query_kind,
    ProfileEvents['QuorumParts'] AS quorum_parts,
    ProfileEvents['QuorumWaitMicroseconds'] > 0 AS quorum_wait_microseconds_non_zero,
    ProfileEvents['QuorumFailedInserts'] AS quorum_failed_inserts
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND query_kind = 'System'
    AND has(databases, current_database())
    AND has(tables, concat(current_database(), '.table2'))
ORDER BY event_time DESC
FORMAT Vertical;