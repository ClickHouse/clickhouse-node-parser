SELECT *
FROM test_table_for_01070_exception_code_in_query_log_table;

SELECT exception_code
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(lower(query), lower('SELECT * FROM test_table_for_01070_exception_code_in_query_log_table%'))
    AND event_date >= yesterday()
    AND event_time > now() - toIntervalMinute(5)
ORDER BY exception_code ASC;