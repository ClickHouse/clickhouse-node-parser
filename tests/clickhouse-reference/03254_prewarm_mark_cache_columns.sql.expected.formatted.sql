-- Tags: no-parallel, no-random-settings, no-random-merge-tree-settings
DROP TABLE IF EXISTS t_prewarm_columns;

CREATE TABLE t_prewarm_columns
(
    a UInt64,
    b UInt64,
    c UInt64,
    d UInt64
)
ENGINE = MergeTree
ORDER BY a
SETTINGS min_bytes_for_wide_part = 0, prewarm_mark_cache = 1, columns_to_prewarm_mark_cache = 'a,c';

INSERT INTO t_prewarm_columns;

SELECT count()
FROM t_prewarm_columns
WHERE NOT ignore(*);

SELECT ProfileEvents['LoadedMarksCount']
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND like(query, 'SELECT count() FROM t_prewarm_columns%')
ORDER BY event_time_microseconds ASC;

DROP TABLE t_prewarm_columns;