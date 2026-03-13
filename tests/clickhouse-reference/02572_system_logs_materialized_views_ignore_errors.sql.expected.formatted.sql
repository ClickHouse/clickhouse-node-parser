SELECT 1
FORMAT Null;

-- lower() to pass through clickhouse-test "exception" check
SELECT
    replaceAll(query, '\n', '\\n'),
    lower(type::String),
    errorCodeToName(exception_code)
FROM `system`.query_log
WHERE current_database = currentDatabase()
ORDER BY event_time_microseconds ASC
FORMAT CSV;