SELECT number + number + number FROM numbers(1);
SELECT ProfileEvents['CompileFunction'] FROM system.query_log WHERE
    current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND query == 'SELECT number + number + number FROM numbers(1);'
    AND event_date >= yesterday() AND event_time > now() - interval 10 minute
    LIMIT 1;
SELECT avg(number), avg(number + 1), avg(number + 2) FROM numbers(1) GROUP BY number;
SELECT ProfileEvents['CompileFunction'] FROM system.query_log WHERE
    current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND query == 'SELECT avg(number), avg(number + 1), avg(number + 2) FROM numbers(1) GROUP BY number;'
    AND event_date >= yesterday() AND event_time > now() - interval 10 minute
    LIMIT 1;
