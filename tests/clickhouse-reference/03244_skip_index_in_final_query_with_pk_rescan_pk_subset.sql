SET use_skip_indexes=1;
SET use_skip_indexes_if_final=1;
SET use_skip_indexes_if_final_exact_mode=1;
CREATE TABLE rmt1
(
    id UInt32,
    val UInt32,
    INDEX vidx val TYPE minmax
) Engine = ReplacingMergeTree ORDER BY id SETTINGS index_granularity = 64;
-- Verify granules selected for the next 5 queries
SELECT splitByChar('/',trimLeft(explain))[1] FROM (
    EXPLAIN indexes=1 SELECT count(*) FROM rmt1 FINAL WHERE id = 25 AND val = 88888888)
WHERE explain like '%Granules:%';
SELECT splitByChar('/',trimLeft(explain))[1] FROM (
    EXPLAIN indexes=1 SELECT count(*) FROM rmt1 FINAL WHERE id < 1000 AND val = 88888888)
WHERE explain like '%Granules:%';
-- PK selects more granules but intersection will be lesser
SELECT splitByChar('/',trimLeft(explain))[1] FROM (
    EXPLAIN indexes=1 SELECT count(*) FROM rmt1 FINAL WHERE id > 18000 AND id < 19500 AND val = 99999999)
WHERE explain like '%Granules:%';
SELECT splitByChar('/',trimLeft(explain))[1] FROM (
    EXPLAIN indexes=1 SELECT count(*) FROM rmt1 FINAL WHERE id IN (100, 500, 12000, 18000) AND val = 88888888)
WHERE explain like '%Granules:%';
SELECT splitByChar('/',trimLeft(explain))[1] FROM (
    EXPLAIN indexes=1 SELECT count(*) FROM rmt1 FINAL WHERE (id BETWEEN 650 AND 900 OR id BETWEEN 8000 AND 9000 OR id BETWEEN 12000 AND 13000 AND id BETWEEN 16000 AND 16500) AND val = 88888888)
WHERE explain like '%Granules:%';
-- execute the queries to verify ranges are correctly added
SELECT count(*) FROM rmt1 FINAL WHERE id = 25 AND val = 88888888;
SELECT count(*) FROM rmt1 FINAL WHERE id < 1000 AND val = 88888888;
SELECT count(*) FROM rmt1 FINAL WHERE id > 18000 AND id < 19500 AND val = 99999999;
SELECT count(*) FROM rmt1 FINAL WHERE id IN (100, 500, 12000, 18000) AND val = 88888888;
SELECT count(*) FROM rmt1 FINAL WHERE (id BETWEEN 650 AND 900 OR id BETWEEN 8000 AND 9000 OR id BETWEEN 12000 AND 13000 AND id BETWEEN 16000 AND 16500) AND val = 88888888;
