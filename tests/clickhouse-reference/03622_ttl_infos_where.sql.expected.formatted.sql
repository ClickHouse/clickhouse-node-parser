DROP TABLE IF EXISTS users;

SET session_timezone = 'UTC';

CREATE TABLE users
(
    uid Int16,
    d DateTime('UTC')
)
ENGINE = MergeTree
ORDER BY uid
TTL d + toIntervalMonth(1) WHERE uid = 1
SETTINGS merge_with_ttl_timeout = 0, min_bytes_for_wide_part = 0, vertical_merge_algorithm_min_rows_to_activate = 0, vertical_merge_algorithm_min_columns_to_activate = 0;

INSERT INTO users SELECT
    arrayJoin([1,2]),
    toDateTime('2020-01-01 00:00:00', 'UTC');

INSERT INTO users SELECT
    arrayJoin([2,3]),
    toDateTime('2020-01-01 00:00:00', 'UTC');

SELECT *
FROM users
ORDER BY `ALL` ASC;

SELECT
    delete_ttl_info_min,
    delete_ttl_info_max,
    rows_where_ttl_info.min,
    rows_where_ttl_info.max
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'users'
    AND active
ORDER BY name ASC;

SELECT merge_algorithm
FROM `system`.part_log
WHERE database = currentDatabase()
    AND table = 'users'
    AND event_type = 'MergeParts'
ORDER BY event_time_microseconds DESC
LIMIT 1;