SELECT *
FROM
    products
CROSS JOIN sales
WHERE sales.product_id = products.id
    AND date = '2024-05-07'
SETTINGS log_comment = '03279_join_choose_build_table_no_stats'
FORMAT Null;

SELECT *
FROM
    sales
CROSS JOIN products
WHERE sales.product_id = products.id
    AND date = '2024-05-07'
SETTINGS log_comment = '03279_join_choose_build_table_no_stats'
FORMAT Null;

SELECT *
FROM
    products
CROSS JOIN sales
WHERE sales.product_id = products.id
    AND date = '2024-05-07'
SETTINGS log_comment = '03279_join_choose_build_table_stats'
FORMAT Null;

SELECT *
FROM
    sales
CROSS JOIN products
WHERE sales.product_id = products.id
    AND date = '2024-05-07'
SETTINGS log_comment = '03279_join_choose_build_table_stats'
FORMAT Null;

SELECT
    if(and(greaterOrEquals(ProfileEvents['JoinBuildTableRowCount'], 100), lessOrEquals(ProfileEvents['JoinBuildTableRowCount'], 2000)), 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinBuildTableRowCount'])),
    if(and(greaterOrEquals(ProfileEvents['JoinProbeTableRowCount'], 90000), lessOrEquals(ProfileEvents['JoinProbeTableRowCount'], 110000)), 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinProbeTableRowCount'])),
    if(ProfileEvents['JoinResultRowCount'] == 1000, 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinResultRowCount'])),
    `Settings`['query_plan_join_swap_table']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND event_date >= yesterday()
    AND query_kind = 'Select'
    AND current_database = currentDatabase()
    AND like(query, '%products, sales%')
    AND log_comment = '03279_join_choose_build_table_no_stats'
ORDER BY event_time DESC
LIMIT 1;

SELECT
    if(and(greaterOrEquals(ProfileEvents['JoinBuildTableRowCount'], 90000), lessOrEquals(ProfileEvents['JoinBuildTableRowCount'], 110000)), 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinBuildTableRowCount'])),
    if(and(greaterOrEquals(ProfileEvents['JoinProbeTableRowCount'], 100), lessOrEquals(ProfileEvents['JoinProbeTableRowCount'], 2000)), 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinProbeTableRowCount'])),
    if(ProfileEvents['JoinResultRowCount'] == 1000, 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinResultRowCount'])),
    `Settings`['query_plan_join_swap_table']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND event_date >= yesterday()
    AND query_kind = 'Select'
    AND current_database = currentDatabase()
    AND like(query, '%sales, products%')
    AND log_comment = '03279_join_choose_build_table_no_stats'
ORDER BY event_time DESC
LIMIT 1;

SELECT
    if(and(greaterOrEquals(ProfileEvents['JoinBuildTableRowCount'], 100), lessOrEquals(ProfileEvents['JoinBuildTableRowCount'], 2000)), 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinBuildTableRowCount'])),
    if(and(greaterOrEquals(ProfileEvents['JoinProbeTableRowCount'], 90000), lessOrEquals(ProfileEvents['JoinProbeTableRowCount'], 110000)), 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinProbeTableRowCount'])),
    if(ProfileEvents['JoinResultRowCount'] == 1000, 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinResultRowCount'])),
    `Settings`['query_plan_join_swap_table']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND event_date >= yesterday()
    AND query_kind = 'Select'
    AND current_database = currentDatabase()
    AND like(query, '%products, sales%')
    AND log_comment = '03279_join_choose_build_table_stats'
ORDER BY event_time DESC
LIMIT 1;

SELECT
    if(and(greaterOrEquals(ProfileEvents['JoinBuildTableRowCount'], 100), lessOrEquals(ProfileEvents['JoinBuildTableRowCount'], 2000)), 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinBuildTableRowCount'])),
    if(and(greaterOrEquals(ProfileEvents['JoinProbeTableRowCount'], 90000), lessOrEquals(ProfileEvents['JoinProbeTableRowCount'], 110000)), 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinProbeTableRowCount'])),
    if(ProfileEvents['JoinResultRowCount'] == 1000, 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinResultRowCount'])),
    `Settings`['query_plan_join_swap_table']
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND event_date >= yesterday()
    AND query_kind = 'Select'
    AND current_database = currentDatabase()
    AND like(query, '%sales, products%')
    AND log_comment = '03279_join_choose_build_table_stats'
ORDER BY event_time DESC
LIMIT 1;