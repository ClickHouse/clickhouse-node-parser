SELECT *
FROM
    t_view AS t1
LEFT JOIN t_mem AS t2
    USING (b)
WHERE t1.a < 2000
SETTINGS log_comment = 'left_join'
FORMAT Null;

SELECT *
FROM
    t_mem AS t1
RIGHT JOIN t_view AS t2
    USING (b)
WHERE t2.a < 2000
SETTINGS log_comment = 'right_join'
FORMAT Null;

SELECT *
FROM left_joined_view
WHERE t1_a < 2000
SETTINGS log_comment = 'left_join_view'
FORMAT Null;

SELECT *
FROM right_joined_view
WHERE t2_a < 2000
SETTINGS log_comment = 'right_join_view'
FORMAT Null;

SELECT
    if(ProfileEvents['SelectedMarks'] == 2, 'ok', format('error: {} @ {}', ProfileEvents['SelectedMarks'], query_id)),
    if(ProfileEvents['SelectedMarksTotal'] == 5, 'ok', format('error: {} @ {}', ProfileEvents['SelectedMarksTotal'], query_id)),
    if(ProfileEvents['JoinProbeTableRowCount'] == 2000, 'ok', format('error: {} @ {}', ProfileEvents['JoinProbeTableRowCount'], query_id)),
    if(ProfileEvents['JoinBuildTableRowCount'] == 5000, 'ok', format('error: {} @ {}', ProfileEvents['JoinBuildTableRowCount'], query_id)),
    if(ProfileEvents['JoinResultRowCount'] == 2000, 'ok', format('error: {} @ {}', ProfileEvents['JoinResultRowCount'], query_id))
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND event_date >= yesterday()
    AND query_kind = 'Select'
    AND event_time >= (
        SELECT ts
        FROM start_ts
    )
    AND log_comment IN ('left_join', 'left_join_view');

SELECT
    if(ProfileEvents['SelectedMarks'] == 2, 'ok', format('error: {} @ {}', ProfileEvents['SelectedMarks'], query_id)),
    if(ProfileEvents['SelectedMarksTotal'] == 5, 'ok', format('error: {} @ {}', ProfileEvents['SelectedMarksTotal'], query_id)),
    if(ProfileEvents['JoinProbeTableRowCount'] == 5000, 'ok', format('error: {} @ {}', ProfileEvents['JoinProbeTableRowCount'], query_id)),
    if(ProfileEvents['JoinBuildTableRowCount'] == 2000, 'ok', format('error: {} @ {}', ProfileEvents['JoinBuildTableRowCount'], query_id)),
    if(ProfileEvents['JoinResultRowCount'] == 2000, 'ok', format('error: {} @ {}', ProfileEvents['JoinResultRowCount'], query_id))
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND event_date >= yesterday()
    AND query_kind = 'Select'
    AND event_time >= (
        SELECT ts
        FROM start_ts
    )
    AND log_comment IN ('right_join', 'right_join_view');