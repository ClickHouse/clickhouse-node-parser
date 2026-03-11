select count() > 0 from system.settings;
select result_rows, result_bytes >= 8 from system.query_log where current_database = currentDatabase() AND event_date >= today() - 1 and lower(query) like '%select count() > 0 from system.settings%' and type = 'QueryFinish' order by query_start_time desc limit 1;
