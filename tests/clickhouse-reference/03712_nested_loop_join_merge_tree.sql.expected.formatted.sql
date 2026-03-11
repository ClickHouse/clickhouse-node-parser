SELECT
    count(),
    countIf(t1.Attribute != ''),
    sum(sipHash64(t1.Attribute))
FROM
    events AS t0
INNER JOIN attributes AS t1
    ON t1.EventId = t0.Id
SETTINGS log_comment = '03712_nested_loop_join_merge_tree_indexed';

SELECT count() + sum(ignore(a + 1))
FROM (
        SELECT 1 AS a
        FROM
            events AS t0
        INNER JOIN attributes AS t1
            ON t1.EventId = t0.Id
    );

SELECT
    count(),
    countIf(t1.Attribute != ''),
    sum(sipHash64(t1.Attribute))
FROM
    events AS t0
INNER JOIN attributes AS t1
    ON t1.EventId = t0.Idu32;

SELECT
    count(),
    countIf(t1.Attribute != ''),
    sum(sipHash64(t1.Attribute))
FROM
    events AS t0
INNER JOIN attributes AS t1
    ON t1.EventId = t0.Idu32n;

SELECT
    count(),
    countIf(t1.Attribute != ''),
    sum(sipHash64(t1.Attribute))
FROM
    events AS t0
INNER JOIN attributes AS t1
    ON t1.EventId = t0.Idlcn;

SELECT
    count(),
    countIf(t1.Attribute != ''),
    sum(sipHash64(t1.Attribute))
FROM
    events AS t0
INNER JOIN attributes AS t1
    ON t1.EventId = t0.Idlc;

SELECT
    count(),
    countIf(t1.Attribute != ''),
    sum(sipHash64(t1.Attribute))
FROM
    events AS t0
INNER JOIN attributes AS t1
    ON t1.OtherId = t0.Idu32n
SETTINGS log_comment = '03712_nested_loop_join_merge_tree_full_scan';

SELECT
    count(),
    countIf(t1.Attribute != ''),
    sum(sipHash64(t1.Attribute))
FROM
    events AS t0
LEFT JOIN attributes AS t1
    ON t1.EventId = t0.Id
SETTINGS log_comment = '03712_nested_loop_join_merge_tree_indexed';

SELECT
    count(),
    countIf(t1.Attribute != ''),
    sum(sipHash64(t1.Attribute))
FROM
    events AS t0
LEFT JOIN attributes AS t1
    ON t1.OtherId = t0.Idu32n
SETTINGS log_comment = '03712_nested_loop_join_merge_tree_full_scan';

SELECT
    if(read_rows < 1000000, 'OK', format('Fail: {} rows read, query_id={}', read_rows, query_id)),
    if(and(greaterOrEquals(ProfileEvents['JoinBuildTableRowCount'], 10), lessOrEquals(ProfileEvents['JoinBuildTableRowCount'], 1000000)), 'OK', format('Fail: JoinBuildTableRowCount={}, query_id={}', ProfileEvents['JoinBuildTableRowCount'], query_id))
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND event_time >= yesterday()
    AND query_kind = 'Select'
    AND log_comment == '03712_nested_loop_join_merge_tree_indexed';

SELECT
    if(read_rows > 2000000, 'OK', format('Fail: {} rows read, query_id="{}"', read_rows, query_id)),
    if(and(greaterOrEquals(ProfileEvents['JoinBuildTableRowCount'], 1100000), lessOrEquals(ProfileEvents['JoinBuildTableRowCount'], 2100000)), 'OK', format('Fail: JoinBuildTableRowCount={}, query_id="{}"', ProfileEvents['JoinBuildTableRowCount'], query_id))
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND event_time >= yesterday()
    AND query_kind = 'Select'
    AND log_comment == '03712_nested_loop_join_merge_tree_full_scan';