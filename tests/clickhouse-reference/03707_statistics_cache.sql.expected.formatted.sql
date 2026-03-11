SELECT sum(val)
FROM sc_unused
SETTINGS
    use_statistics_cache = 0,
    log_comment = 'nouse-agg'
FORMAT Null;

SELECT toUInt8(ProfileEvents['LoadedStatisticsMicroseconds'] = 0)
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND log_comment = 'nouse-agg'
ORDER BY event_time_microseconds DESC
LIMIT 1;

SELECT count()
FROM st_cm_lc
WHERE cat = 'PROMO'
SETTINGS
    use_statistics_cache = 0,
    log_comment = 'cm-lc-load'
FORMAT Null;

SELECT toUInt8(ProfileEvents['LoadedStatisticsMicroseconds'] > 0)
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND log_comment = 'cm-lc-load'
ORDER BY event_time_microseconds DESC
LIMIT 1;

SELECT count()
FROM
    sj_a AS a
INNER JOIN sj_b AS b
    ON a.id = b.id
WHERE b.t = 'PROMO'
SETTINGS
    use_statistics_cache = 0,
    query_plan_optimize_join_order_limit = 10,
    log_comment = 'join-load'
FORMAT Null;

SELECT toUInt8(ProfileEvents['LoadedStatisticsMicroseconds'] > 0)
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND log_comment = 'join-load'
ORDER BY event_time_microseconds DESC
LIMIT 1;