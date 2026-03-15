SET prefer_localhost_replica = 1;

CREATE TABLE data_02572
(
    key Int
)
ENGINE = Memory();

CREATE TABLE proxy_02572
(
    key Int
)
ENGINE = Distributed('test_shard_localhost', currentDatabase(), 'receiver_02572');

-- proxy data with MV
CREATE MATERIALIZED VIEW push_to_proxy_mv_02572
TO proxy_02572
AS
SELECT *
FROM data_02572;

-- { echoOn }
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

CREATE TABLE receiver_02572 AS data_02572;

SELECT *
FROM receiver_02572
ORDER BY key ASC;