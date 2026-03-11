SELECT 1
FROM
    t2
LEFT JOIN t1
    ON t2.id = t1.fid
LEFT JOIN t3
    ON t1.tid = t3.id
WHERE true
    AND (isNotNull(t2.resource_id))
    AND (t2.status IN ('OPEN'))
    AND (t3.status IN ('BACKLOG'))
SETTINGS log_comment = '03594_push_more_filters_down_joins';

SELECT throwIf(ProfileEvents['JoinResultRowCount'] != 0)
FROM `system`.query_log
WHERE log_comment = '03594_push_more_filters_down_joins'
    AND current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND event_date >= yesterday()
    AND event_time >= NOW() - toIntervalMinute(10)
FORMAT Null;

SELECT splitByWhitespace(trimBoth(`explain`))[1] AS `step`
FROM (
        EXPLAIN
        SELECT 1
        FROM
            t2
        LEFT JOIN t1
            ON t2.id = t1.fid
        LEFT JOIN t3
            ON t1.tid = t3.id
        WHERE true
            AND (isNotNull(t2.resource_id))
            AND (t2.status IN ('OPEN'))
            AND (t3.status IN ('BACKLOG'))
        SETTINGS enable_join_runtime_filters = 0
    )
WHERE ilike(`step`, 'Join%')
    OR ilike(`step`, '%Filter%');