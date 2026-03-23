-- Tags: no-parallel
-- no-parallel: SYSTEM CLEAR MARK CACHE is used.

DROP TABLE IF EXISTS t_prewarm_add_column;
CREATE TABLE t_prewarm_add_column (a UInt64)
ENGINE = MergeTree ORDER BY a
SETTINGS prewarm_mark_cache = 1, min_bytes_for_wide_part = 0;
INSERT INTO t_prewarm_add_column VALUES (1);
INSERT INTO t_prewarm_add_column VALUES (2, 2);
SELECT * FROM t_prewarm_add_column ORDER BY a;
SELECT ProfileEvents['LoadedMarksCount'] FROM system.query_log
WHERE current_database = currentDatabase() AND type = 'QueryFinish' AND query LIKE 'SELECT * FROM t_prewarm_add_column%'
ORDER BY event_time_microseconds;
DROP TABLE t_prewarm_add_column;
