
select * from data_02572 order by key;
-- lower(status) to pass through clickhouse-test "exception" check
select lower(status::String), errorCodeToName(exception_code)
from system.query_views_log where
    view_name = concatWithSeparator('.', currentDatabase(), 'push_to_proxy_mv_02572') and
    view_target = concatWithSeparator('.', currentDatabase(), 'proxy_02572')
    order by event_date, event_time
;
select * from receiver_02572 order by key;
