-- test_enable_global_with_statement_performance_2
SELECT count() FROM ev WHERE a IN (SELECT a FROM idx) SETTINGS enable_global_with_statement = 1;
SELECT count(read_rows) FROM (SELECT read_rows FROM system.query_log WHERE current_database=currentDatabase() AND type='QueryFinish' AND query LIKE '-- test_enable_global_with_statement_performance%' ORDER BY initial_query_start_time_microseconds DESC LIMIT 3) GROUP BY read_rows;
