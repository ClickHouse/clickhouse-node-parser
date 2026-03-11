SELECT sum(id)
FROM test
FORMAT Null;

SELECT argMaxMerge(amax)
FROM test
FORMAT Null;

SELECT
    'UInt64',
    read_rows,
    read_bytes
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND query = 'SELECT sum(id) FROM test FORMAT Null;'
    AND type = 2
    AND event_date >= yesterday()
ORDER BY event_time_microseconds ASC;

SELECT
    'AggregateFunction(argMax, String, DateTime)',
    read_rows,
    read_bytes
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND query = 'SELECT argMaxMerge(amax) FROM test FORMAT Null;'
    AND type = 2
    AND event_date >= yesterday()
ORDER BY event_time_microseconds ASC;