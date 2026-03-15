SET allow_suspicious_low_cardinality_types = 1;

CREATE TABLE events
(
    Id UInt64,
    Idu32 UInt32 MATERIALIZED toUInt32(Id),
    Idu32n Nullable(UInt32) MATERIALIZED if(Id == 111, NULL, toUInt32(Id)),
    Idlcn LowCardinality(Nullable(UInt64)) MATERIALIZED if(Id == 111, NULL, Id),
    Idlc LowCardinality(UInt64) MATERIALIZED Id,
    Payload String,
    Time DateTime
)
ENGINE = Memory;

CREATE TABLE attributes
(
    EventId UInt64,
    OtherId Nullable(UInt32),
    Attribute String
)
ENGINE = MergeTree
ORDER BY EventId;

SET query_plan_join_swap_table = 0;

SET enable_analyzer = 1;

SET join_algorithm = 'direct';

SET min_joined_block_size_rows = 0, min_joined_block_size_bytes = 0;

SELECT
    count(),
    countIf(t1.Attribute != ''),
    sum(sipHash64(t1.Attribute))
FROM
    events AS t0
INNER JOIN attributes AS t1
    ON t1.EventId = t0.Id
SETTINGS log_comment = '03712_nested_loop_join_merge_tree_indexed';

-- Select without attributes
SELECT count() + sum(ignore(a + 1))
FROM (
        SELECT 1 AS a
        FROM
            events AS t0
        INNER JOIN attributes AS t1
            ON t1.EventId = t0.Id
    );

-- Different key
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
    -- Indexed lookup, right table is not fully scanned
    if(read_rows < 1000000, 'OK', format('Fail: {} rows read, query_id={}', read_rows, query_id)),
    if(and(greaterOrEquals(ProfileEvents['JoinBuildTableRowCount'], 10), lessOrEquals(ProfileEvents['JoinBuildTableRowCount'], 1000000)), 'OK', format('Fail: JoinBuildTableRowCount={}, query_id={}', ProfileEvents['JoinBuildTableRowCount'], query_id))
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND event_time >= yesterday()
    AND query_kind = 'Select'
    AND log_comment == '03712_nested_loop_join_merge_tree_indexed';

SELECT
    -- Full scan on each lookup
    if(read_rows > 2000000, 'OK', format('Fail: {} rows read, query_id="{}"', read_rows, query_id)),
    if(and(greaterOrEquals(ProfileEvents['JoinBuildTableRowCount'], 1100000), lessOrEquals(ProfileEvents['JoinBuildTableRowCount'], 2100000)), 'OK', format('Fail: JoinBuildTableRowCount={}, query_id="{}"', ProfileEvents['JoinBuildTableRowCount'], query_id))
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND event_time >= yesterday()
    AND query_kind = 'Select'
    AND log_comment == '03712_nested_loop_join_merge_tree_full_scan';