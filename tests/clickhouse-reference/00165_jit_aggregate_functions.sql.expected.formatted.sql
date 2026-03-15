-- Tags: stateful
SET min_count_to_compile_aggregate_expression = 0;

-- The test uses many aggregations. A low max_bytes_before_external_group_by value will lead to high disk usage
-- which in CI leads to timeouts
SET max_bytes_before_external_group_by = 0;

SET max_bytes_ratio_before_external_group_by = 0;

SELECT
    CounterID,
    min(WatchID),
    max(WatchID),
    sum(WatchID),
    avg(WatchID),
    avgWeighted(WatchID, CounterID),
    count(WatchID),
    groupBitOr(WatchID),
    groupBitAnd(WatchID),
    groupBitXor(WatchID)
FROM test.hits
GROUP BY CounterID
ORDER BY count() DESC
LIMIT 20;

SELECT
    CounterID,
    min(WatchID),
    max(WatchID),
    sum(WatchID),
    sum(toUInt128(WatchID)),
    avg(WatchID),
    avgWeighted(WatchID, CounterID),
    count(WatchID),
    groupBitOr(WatchID),
    groupBitAnd(WatchID),
    groupBitXor(WatchID)
FROM test.hits
GROUP BY CounterID
ORDER BY count() DESC
LIMIT 20;

SELECT
    min(WatchID) AS min_watch_id,
    max(WatchID),
    sum(WatchID),
    avg(WatchID),
    avgWeighted(WatchID, CounterID),
    count(WatchID),
    groupBitOr(WatchID),
    groupBitAnd(WatchID),
    groupBitXor(WatchID)
FROM test.hits
ORDER BY min_watch_id DESC
LIMIT 20;

SELECT
    min(WatchID) AS min_watch_id,
    max(WatchID),
    sum(WatchID),
    sum(toUInt128(WatchID)),
    avg(WatchID),
    avgWeighted(WatchID, CounterID),
    count(WatchID),
    groupBitOr(WatchID),
    groupBitAnd(WatchID),
    groupBitXor(WatchID)
FROM test.hits
ORDER BY min_watch_id DESC
LIMIT 20;