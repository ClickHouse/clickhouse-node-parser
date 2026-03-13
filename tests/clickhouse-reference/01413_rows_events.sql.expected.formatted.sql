SELECT written_rows
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(query, 'INSERT INTO /* test 01413, query 1 */ rows_events_test%')
    AND type = 2
    AND event_date >= yesterday()
ORDER BY event_time DESC
LIMIT 1;

SELECT ProfileEvents['InsertedRows'] AS value
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(query, 'INSERT INTO /* test 01413, query 1 */ rows_events_test%')
    AND type = 2
    AND event_date >= yesterday()
ORDER BY event_time DESC
LIMIT 1;

SELECT *
FROM
    /* test 01413, query 3 */
    rows_events_test
WHERE v = 2;

SELECT read_rows
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(query, 'SELECT * FROM /* test 01413, query 3 */ rows_events_test%')
    AND type = 2
    AND event_date >= yesterday()
ORDER BY event_time DESC
LIMIT 1;

SELECT ProfileEvents['SelectedRows'] AS value
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(query, 'SELECT * FROM /* test 01413, query 3 */ rows_events_test%')
    AND type = 2
    AND event_date >= yesterday()
ORDER BY event_time DESC
LIMIT 1;