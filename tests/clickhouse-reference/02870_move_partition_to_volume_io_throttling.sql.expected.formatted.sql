SELECT
    disk_name,
    `partition`,
    `rows`
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'test_move_partition_throttling'
    AND active;

SELECT
    query_kind,
    query_duration_ms > 4e3
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND query_kind = 'Alter';