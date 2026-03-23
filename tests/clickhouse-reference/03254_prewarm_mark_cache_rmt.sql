CREATE TABLE t_prewarm_cache_rmt_1 (a UInt64, b UInt64, c UInt64)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/03254_prewarm_mark_cache_smt/t_prewarm_cache', '1')
ORDER BY a SETTINGS prewarm_mark_cache = 1;
CREATE TABLE t_prewarm_cache_rmt_2 (a UInt64, b UInt64, c UInt64)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/03254_prewarm_mark_cache_smt/t_prewarm_cache', '2')
ORDER BY a SETTINGS prewarm_mark_cache = 1;
-- Check that prewarm works on insert.
INSERT INTO t_prewarm_cache_rmt_1 SELECT number, rand(), rand() FROM numbers(20000);
SELECT count() FROM t_prewarm_cache_rmt_1 WHERE NOT ignore(*);
SELECT count() FROM t_prewarm_cache_rmt_2 WHERE NOT ignore(*);
SELECT ProfileEvents['LoadedMarksCount'] > 0 FROM system.query_log
WHERE current_database = currentDatabase() AND type = 'QueryFinish' AND query LIKE 'SELECT count() FROM t_prewarm_cache%'
ORDER BY event_time_microseconds;
