SELECT * FROM products, sales
WHERE sales.product_id = products.id AND date = '2024-05-07'
SETTINGS log_comment = '03279_join_choose_build_table_no_stats' FORMAT Null;
SELECT * FROM sales, products
WHERE sales.product_id = products.id AND date = '2024-05-07'
SETTINGS log_comment = '03279_join_choose_build_table_no_stats' FORMAT Null;
SELECT * FROM products, sales
WHERE sales.product_id = products.id AND date = '2024-05-07'
SETTINGS log_comment = '03279_join_choose_build_table_stats' FORMAT Null;
SELECT * FROM sales, products
WHERE sales.product_id = products.id AND date = '2024-05-07'
SETTINGS log_comment = '03279_join_choose_build_table_stats' FORMAT Null;
-- condtitions are pushed down, but no filter by index applied
-- build table is as it's written in query

SELECT
    if(ProfileEvents['JoinBuildTableRowCount'] BETWEEN 100 AND 2000, 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinBuildTableRowCount'])),
    if(ProfileEvents['JoinProbeTableRowCount'] BETWEEN 90_000 AND 110_000, 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinProbeTableRowCount'])),
    if(ProfileEvents['JoinResultRowCount'] == 1000, 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinResultRowCount'])),
    Settings['query_plan_join_swap_table'],
FROM system.query_log
WHERE type = 'QueryFinish' AND event_date >= yesterday() AND query_kind = 'Select' AND current_database = currentDatabase()
AND query like '%products, sales%'
AND log_comment = '03279_join_choose_build_table_no_stats'
ORDER BY event_time DESC
LIMIT 1;
SELECT
    if(ProfileEvents['JoinBuildTableRowCount'] BETWEEN 90_000 AND 110_000, 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinBuildTableRowCount'])),
    if(ProfileEvents['JoinProbeTableRowCount'] BETWEEN 100 AND 2000, 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinProbeTableRowCount'])),
    if(ProfileEvents['JoinResultRowCount'] == 1000, 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinResultRowCount'])),
    Settings['query_plan_join_swap_table'],
FROM system.query_log
WHERE type = 'QueryFinish' AND event_date >= yesterday() AND query_kind = 'Select' AND current_database = currentDatabase()
AND query like '%sales, products%'
AND log_comment = '03279_join_choose_build_table_no_stats'
ORDER BY event_time DESC
LIMIT 1;
-- after adding index, optimizer can choose best table order

SELECT
    if(ProfileEvents['JoinBuildTableRowCount'] BETWEEN 100 AND 2000, 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinBuildTableRowCount'])),
    if(ProfileEvents['JoinProbeTableRowCount'] BETWEEN 90_000 AND 110_000, 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinProbeTableRowCount'])),
    if(ProfileEvents['JoinResultRowCount'] == 1000, 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinResultRowCount'])),
    Settings['query_plan_join_swap_table'],
FROM system.query_log
WHERE type = 'QueryFinish' AND event_date >= yesterday() AND query_kind = 'Select' AND current_database = currentDatabase()
AND query like '%products, sales%'
AND log_comment = '03279_join_choose_build_table_stats'
ORDER BY event_time DESC
LIMIT 1;
SELECT
    if(ProfileEvents['JoinBuildTableRowCount'] BETWEEN 100 AND 2000, 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinBuildTableRowCount'])),
    if(ProfileEvents['JoinProbeTableRowCount'] BETWEEN 90_000 AND 110_000, 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinProbeTableRowCount'])),
    if(ProfileEvents['JoinResultRowCount'] == 1000, 'ok', format('fail({}): {}', query_id, ProfileEvents['JoinResultRowCount'])),
    Settings['query_plan_join_swap_table'],
FROM system.query_log
WHERE type = 'QueryFinish' AND event_date >= yesterday() AND query_kind = 'Select' AND current_database = currentDatabase()
AND query like '%sales, products%'
AND log_comment = '03279_join_choose_build_table_stats'
ORDER BY event_time DESC
LIMIT 1;
