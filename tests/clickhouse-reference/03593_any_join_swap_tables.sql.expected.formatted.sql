SELECT *
FROM
    lhs
INNER JOIN rhs
    ON lhs.a = rhs.a
FORMAT Null
SETTINGS log_comment = '03593_any_join_swap_tables';

SELECT ProfileEvents['JoinBuildTableRowCount'] AS build_table_size
FROM `system`.query_log
WHERE log_comment = '03593_any_join_swap_tables'
    AND current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND event_date >= yesterday()
    AND event_time >= NOW() - toIntervalMinute(10);