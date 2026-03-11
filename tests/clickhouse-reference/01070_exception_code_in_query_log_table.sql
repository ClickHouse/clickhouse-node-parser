SELECT * FROM test_table_for_01070_exception_code_in_query_log_table; -- { serverError UNKNOWN_TABLE }
SELECT exception_code FROM system.query_log WHERE current_database = currentDatabase() AND lower(query) LIKE lower('SELECT * FROM test_table_for_01070_exception_code_in_query_log_table%') AND event_date >= yesterday() AND event_time > now() - INTERVAL 5 MINUTE ORDER BY exception_code;
