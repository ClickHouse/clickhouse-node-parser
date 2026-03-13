SELECT *
FROM data
SETTINGS load_marks_asynchronously = 1
FORMAT Null; /* 1 */

SELECT
    query,
    ProfileEvents['BackgroundLoadingMarksTasks'] > 0 AS async,
    ProfileEvents['MarksTasksFromCache'] > 0 AS sync
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND query_kind = 'Select'
    AND type != 'QueryStart'
ORDER BY event_time_microseconds ASC
FORMAT Vertical;