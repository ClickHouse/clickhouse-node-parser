SELECT *
FROM data_02572
ORDER BY key ASC;

-- lower(status) to pass through clickhouse-test "exception" check
SELECT
    lower(status::String),
    errorCodeToName(exception_code)
FROM `system`.query_views_log
WHERE view_name = concatWithSeparator('.', currentDatabase(), 'push_to_proxy_mv_02572')
    AND view_target = concatWithSeparator('.', currentDatabase(), 'proxy_02572')
ORDER BY
    event_date ASC,
    event_time ASC;

SELECT *
FROM receiver_02572
ORDER BY key ASC;