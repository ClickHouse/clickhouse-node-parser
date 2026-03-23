-- Tags: no-parallel
-- no-parallel: SYSTEM CLEAR MARK CACHE is used.
SYSTEM DROP  TABLE IF EXISTS t_prewarm_add_column;

CREATE TABLE t_prewarm_add_column
(
    a UInt64
)
ENGINE = MergeTree
ORDER BY a
SETTINGS prewarm_mark_cache = 1, min_bytes_for_wide_part = 0;

INSERT INTO t_prewarm_add_column;

INSERT INTO t_prewarm_add_column;

SELECT *
FROM t_prewarm_add_column
ORDER BY a ASC;

SELECT ProfileEvents['LoadedMarksCount']
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND like(query, 'SELECT * FROM t_prewarm_add_column%')
ORDER BY event_time_microseconds ASC;

SYSTEM DROP  TABLE t_prewarm_add_column;