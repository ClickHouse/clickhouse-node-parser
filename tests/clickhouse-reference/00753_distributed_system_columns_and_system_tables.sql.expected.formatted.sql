SELECT
    total_bytes,
    total_rows
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'check_system_tables';

SELECT
    total_bytes > 0,
    total_rows
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'check_system_tables';