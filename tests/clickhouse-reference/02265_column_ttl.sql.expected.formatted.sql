SELECT *
FROM `system`.part_log
WHERE database = currentDatabase()
    AND like(table, 'ttl_02265%')
    AND error != 0
    AND errorCodeToName(error) != 'NO_REPLICA_HAS_PART';