SELECT sum(number)
FROM remote('127.0.0.{1|2}', numbers_mt(1000000))
GROUP BY number % 2
ORDER BY number % 2 ASC;

SELECT length(thread_ids) >= 1
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND event_date >= today() - 1
    AND like(lower(query), '%select sum(number) from remote(_127.0.0.{1|2}_, numbers_mt(1000000)) group by number %')
    AND type = 'QueryFinish'
ORDER BY query_start_time DESC
LIMIT 1;