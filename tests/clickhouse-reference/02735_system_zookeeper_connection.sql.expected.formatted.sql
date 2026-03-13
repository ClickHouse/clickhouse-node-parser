-- NOTE: Durind the query execution, now() can be evaluated a bit earlier than connected_time
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

-- keeper_api_version will by 0 for auxiliary_zookeeper2, because we fail to get /api_version due to chroot
-- I'm not sure if it's a bug or a useful trick to fallback to basic api
-- Also, auxiliary zookeeper is created lazily
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