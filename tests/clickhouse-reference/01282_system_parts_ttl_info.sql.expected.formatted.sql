SELECT
    `rows`,
    delete_ttl_info_min,
    delete_ttl_info_max,
    move_ttl_info.expression,
    move_ttl_info.min,
    move_ttl_info.max
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'ttl';

SELECT
    `rows`,
    toTimeZone(delete_ttl_info_min, 'UTC'),
    toTimeZone(delete_ttl_info_max, 'UTC'),
    move_ttl_info.expression,
    move_ttl_info.min,
    move_ttl_info.max
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'ttl'
    AND active;