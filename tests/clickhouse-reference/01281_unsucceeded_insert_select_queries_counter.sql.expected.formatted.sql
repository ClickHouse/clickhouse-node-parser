SELECT *
FROM table_that_do_not_exists;

SELECT throwIf(1);

SELECT
    normalizeQuery(query),
    type,
    ProfileEvents['FailedSelectQuery'],
    ProfileEvents['FailedInsertQuery']
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND query_kind IN ('Select', 'Insert')
    AND event_date >= yesterday()
    AND type != 'QueryStart'
ORDER BY event_time_microseconds ASC;