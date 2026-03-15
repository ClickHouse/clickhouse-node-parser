set prefer_localhost_replica=1;
create table data_02572 (key Int) engine=Memory();
create table proxy_02572 (key Int) engine=Distributed('test_shard_localhost', currentDatabase(), 'receiver_02572');
-- proxy data with MV
create materialized view push_to_proxy_mv_02572 to proxy_02572 as select * from data_02572;
-- { echoOn }
select * from data_02572 order by key;
-- lower(status) to pass through clickhouse-test "exception" check
select lower(status::String), errorCodeToName(exception_code)
from system.query_views_log where
    view_name = concatWithSeparator('.', currentDatabase(), 'push_to_proxy_mv_02572') and
    view_target = concatWithSeparator('.', currentDatabase(), 'proxy_02572')
    order by event_date, event_time
;
create table receiver_02572 as data_02572;
select * from receiver_02572 order by key;
