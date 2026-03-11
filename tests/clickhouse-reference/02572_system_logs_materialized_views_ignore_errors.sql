select 1 format Null;
-- lower() to pass through clickhouse-test "exception" check
select replaceAll(query, '\n', '\\n'), lower(type::String), errorCodeToName(exception_code)
    from system.query_log
    where current_database = currentDatabase()
    order by event_time_microseconds
    format CSV;
