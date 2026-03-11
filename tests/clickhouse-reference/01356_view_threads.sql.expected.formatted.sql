SELECT
    g % 2 AS gg,
    sum(s)
FROM table_01356_view_threads
GROUP BY gg
ORDER BY gg ASC;

SELECT length(thread_ids) >= 1
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND event_date >= today() - 1
    AND like(lower(query), '%select g % 2 as gg, sum(s) from table_01356_view_threads group by gg order by gg%')
    AND type = 'QueryFinish'
ORDER BY query_start_time DESC
LIMIT 1;