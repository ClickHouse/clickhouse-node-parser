SELECT
    read_rows = written_rows,
    read_rows = result_rows,
    read_bytes = written_bytes,
    read_bytes = result_bytes
FROM `system`.query_log
WHERE normalized_query_hash = 1214411238725380014
    AND type = 'QueryFinish'
    AND current_database = currentDatabase()
FORMAT CSV;