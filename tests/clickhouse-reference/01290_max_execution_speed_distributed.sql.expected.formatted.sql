SELECT count('special query for 01290_max_execution_speed_distributed')
FROM (
        SELECT
            sleep(0.001),
            number
        FROM remote('127.0.0.{2,3}', numbers(100000))
    )
SETTINGS
    max_execution_speed = 100000,
    timeout_before_checking_execution_speed = 0,
    max_block_size = 1000;

SELECT max(t) - min(t) >= 1
FROM times;

SELECT DISTINCT query_duration_ms >= 500
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND event_date >= yesterday()
    AND event_time >= now() - toIntervalMinute(5)
    AND like(query, '%special query for 01290_max_execution_speed_distributed%')
    AND notLike(query, '%system.query_log%')
    AND type = 2;