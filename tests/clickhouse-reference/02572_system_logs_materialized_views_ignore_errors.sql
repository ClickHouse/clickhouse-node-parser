-- Tags: no-parallel, no-replicated-database
-- Tag no-parallel: due to attaching to system.query_log
-- Tag no-replicated-database: Replicated database will has extra queries

-- Attach MV to system.query_log and check that writing query_log will not fail

set log_queries=1;
create table log_proxy_02572 as system.query_log engine=Distributed('test_shard_localhost', currentDatabase(), 'receiver_02572');
create materialized view push_to_logs_proxy_mv_02572 to log_proxy_02572 as select * from system.query_log;
select 1 format Null;
set log_queries=0;
-- lower() to pass through clickhouse-test "exception" check
select replaceAll(query, '\n', '\\n'), lower(type::String), errorCodeToName(exception_code)
    from system.query_log
    where current_database = currentDatabase()
    order by event_time_microseconds
    format CSV;
