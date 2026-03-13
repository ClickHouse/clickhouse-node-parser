-- CHECK LOGS OF INSERT 1
SELECT
    'Query log rows' AS stage,
    read_rows,
    written_rows,
    arraySort(databases) AS databases,
    arraySort(tables) AS tables,
    arraySort(views) AS views,
    ProfileEvents['SleepFunctionCalls'] AS sleep_calls,
    ProfileEvents['SleepFunctionMicroseconds'] AS sleep_us,
    ProfileEvents['SelectedRows'] AS profile_select_rows,
    ProfileEvents['SelectedBytes'] AS profile_select_bytes,
    ProfileEvents['InsertedRows'] AS profile_insert_rows,
    ProfileEvents['InsertedBytes'] AS profile_insert_bytes
FROM `system`.query_log
WHERE like(query, '-- INSERT 1%INSERT INTO table_a%')
    AND current_database = currentDatabase()
    AND event_date >= yesterday()
FORMAT Vertical;

SELECT
    'Depending views' AS stage,
    view_name,
    view_type,
    status,
    view_target,
    view_query,
    read_rows,
    written_rows,
    ProfileEvents['SleepFunctionCalls'] AS sleep_calls,
    ProfileEvents['SleepFunctionMicroseconds'] AS sleep_us,
    ProfileEvents['SelectedRows'] AS profile_select_rows,
    ProfileEvents['SelectedBytes'] AS profile_select_bytes,
    ProfileEvents['InsertedRows'] AS profile_insert_rows,
    ProfileEvents['InsertedBytes'] AS profile_insert_bytes
FROM `system`.query_views_log
WHERE initial_query_id = (
        SELECT initial_query_id
        FROM `system`.query_log
        WHERE like(query, '-- INSERT 1%INSERT INTO table_a%')
            AND current_database = currentDatabase()
            AND event_date >= yesterday()
        LIMIT 1
    )
ORDER BY view_name ASC
FORMAT Vertical;

-- CHECK LOGS OF INSERT 2
SELECT
    'Query log rows 2' AS stage,
    read_rows,
    written_rows,
    arraySort(databases) AS databases,
    arraySort(tables) AS tables,
    arraySort(views) AS views,
    ProfileEvents['SleepFunctionCalls'] AS sleep_calls,
    ProfileEvents['SleepFunctionMicroseconds'] AS sleep_us,
    ProfileEvents['SelectedRows'] AS profile_select_rows,
    ProfileEvents['SelectedBytes'] AS profile_select_bytes,
    ProfileEvents['InsertedRows'] AS profile_insert_rows,
    ProfileEvents['InsertedBytes'] AS profile_insert_bytes
FROM `system`.query_log
WHERE like(query, '-- INSERT 2%INSERT INTO table_d%')
    AND current_database = currentDatabase()
    AND event_date >= yesterday()
FORMAT Vertical;

SELECT
    'Depending views 2' AS stage,
    view_name,
    view_type,
    status,
    view_target,
    view_query,
    read_rows,
    written_rows,
    ProfileEvents['SleepFunctionCalls'] AS sleep_calls,
    ProfileEvents['SleepFunctionMicroseconds'] AS sleep_us,
    ProfileEvents['SelectedRows'] AS profile_select_rows,
    ProfileEvents['SelectedBytes'] AS profile_select_bytes,
    ProfileEvents['InsertedRows'] AS profile_insert_rows,
    ProfileEvents['InsertedBytes'] AS profile_insert_bytes
FROM `system`.query_views_log
WHERE initial_query_id = (
        SELECT initial_query_id
        FROM `system`.query_log
        WHERE like(query, '-- INSERT 2%INSERT INTO table_d%')
            AND current_database = currentDatabase()
            AND event_date >= yesterday()
        LIMIT 1
    )
ORDER BY view_name ASC
FORMAT Vertical;