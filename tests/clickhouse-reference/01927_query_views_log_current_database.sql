-- CHECK LOGS OF INSERT 1
SELECT
    'Query log rows' as stage,
    read_rows,
    written_rows,
    arraySort(databases) as databases,
    arraySort(tables) as tables,
    arraySort(views) as views,
    ProfileEvents['SleepFunctionCalls'] as sleep_calls,
    ProfileEvents['SleepFunctionMicroseconds'] as sleep_us,
    ProfileEvents['SelectedRows'] as profile_select_rows,
    ProfileEvents['SelectedBytes'] as profile_select_bytes,
    ProfileEvents['InsertedRows'] as profile_insert_rows,
    ProfileEvents['InsertedBytes'] as profile_insert_bytes
FROM system.query_log
WHERE query like '-- INSERT 1%INSERT INTO table_a%'
  AND current_database = currentDatabase()
  AND event_date >= yesterday()
FORMAT Vertical;
SELECT
    'Depending views' as stage,
    view_name,
    view_type,
    status,
    view_target,
    view_query,
    read_rows,
    written_rows,
    ProfileEvents['SleepFunctionCalls'] as sleep_calls,
    ProfileEvents['SleepFunctionMicroseconds'] as sleep_us,
    ProfileEvents['SelectedRows'] as profile_select_rows,
    ProfileEvents['SelectedBytes'] as profile_select_bytes,
    ProfileEvents['InsertedRows'] as profile_insert_rows,
    ProfileEvents['InsertedBytes'] as profile_insert_bytes
FROM system.query_views_log
WHERE initial_query_id =
      (
          SELECT initial_query_id
          FROM system.query_log
          WHERE query like '-- INSERT 1%INSERT INTO table_a%'
            AND current_database = currentDatabase()
            AND event_date >= yesterday()
          LIMIT 1
      )
ORDER BY view_name
FORMAT Vertical;
-- CHECK LOGS OF INSERT 2
SELECT
    'Query log rows 2' as stage,
    read_rows,
    written_rows,
    arraySort(databases) as databases,
    arraySort(tables) as tables,
    arraySort(views) as views,
    ProfileEvents['SleepFunctionCalls'] as sleep_calls,
    ProfileEvents['SleepFunctionMicroseconds'] as sleep_us,
    ProfileEvents['SelectedRows'] as profile_select_rows,
    ProfileEvents['SelectedBytes'] as profile_select_bytes,
    ProfileEvents['InsertedRows'] as profile_insert_rows,
    ProfileEvents['InsertedBytes'] as profile_insert_bytes
FROM system.query_log
WHERE query like '-- INSERT 2%INSERT INTO table_d%'
  AND current_database = currentDatabase()
  AND event_date >= yesterday()
FORMAT Vertical;
SELECT
    'Depending views 2' as stage,
    view_name,
    view_type,
    status,
    view_target,
    view_query,
    read_rows,
    written_rows,
    ProfileEvents['SleepFunctionCalls'] as sleep_calls,
    ProfileEvents['SleepFunctionMicroseconds'] as sleep_us,
    ProfileEvents['SelectedRows'] as profile_select_rows,
    ProfileEvents['SelectedBytes'] as profile_select_bytes,
    ProfileEvents['InsertedRows'] as profile_insert_rows,
    ProfileEvents['InsertedBytes'] as profile_insert_bytes
FROM system.query_views_log
WHERE initial_query_id =
      (
          SELECT initial_query_id
          FROM system.query_log
          WHERE query like '-- INSERT 2%INSERT INTO table_d%'
            AND current_database = currentDatabase()
            AND event_date >= yesterday()
          LIMIT 1
      )
ORDER BY view_name
FORMAT Vertical;
