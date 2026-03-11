select x from table_01323_many_parts limit 10 format Null;
select peak_threads_usage <= 4 from system.query_log where current_database = currentDatabase() AND event_date >= today() - 1 and query ilike '%select x from table_01323_many_parts%' and query not like '%system.query_log%' and type = 'QueryFinish' order by query_start_time desc limit 1;
select x from table_01323_many_parts order by x limit 10 format Null;
select peak_threads_usage <= 36 from system.query_log where current_database = currentDatabase() AND event_date >= today() - 1 and query ilike '%select x from table_01323_many_parts order by x%' and query not like '%system.query_log%' and type = 'QueryFinish' order by query_start_time desc limit 1;
