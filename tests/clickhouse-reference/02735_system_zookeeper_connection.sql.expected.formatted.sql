SELECT
    name,
    host,
    port,
    index,
    is_expired,
    keeper_api_version,
    (and(greaterOrEquals(connected_time, yesterday()), lessOrEquals(connected_time, now() + toIntervalSecond(3)))),
    (abs(session_uptime_elapsed_seconds - zookeeperSessionUptime()) < 10),
    enabled_feature_flags
FROM `system`.zookeeper_connection
WHERE name = 'default';

SELECT
    name,
    host,
    port,
    index,
    is_expired,
    keeper_api_version,
    (and(greaterOrEquals(connected_time, yesterday()), lessOrEquals(connected_time, now() + toIntervalSecond(3))))
FROM `system`.zookeeper_connection
WHERE name != 'default';