SELECT
    view_name,
    read_rows,
    read_bytes,
    written_rows,
    written_bytes
FROM `system`.query_views_log
WHERE startsWith(view_name, concat(currentDatabase(), '.mv'))
ORDER BY view_name ASC
FORMAT Vertical;

SELECT
    read_rows,
    read_bytes,
    written_rows,
    written_bytes
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND query_kind = 'Insert'
    AND current_database = currentDatabase()
FORMAT Vertical;