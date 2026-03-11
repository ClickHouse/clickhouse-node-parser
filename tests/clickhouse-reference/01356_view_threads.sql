select g % 2 as gg, sum(s) from table_01356_view_threads group by gg order by gg;
select length(thread_ids) >= 1 from system.query_log where current_database = currentDatabase() AND event_date >= today() - 1 and lower(query) like '%select g % 2 as gg, sum(s) from table_01356_view_threads group by gg order by gg%' and type = 'QueryFinish' order by query_start_time desc limit 1;
