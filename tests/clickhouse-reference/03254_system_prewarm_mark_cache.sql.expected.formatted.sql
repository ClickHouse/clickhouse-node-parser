CREATE TABLE t_prewarm_cache
(
    a UInt64,
    b UInt64,
    c UInt64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/03254_prewarm_mark_cache_smt/t_prewarm_cache', '1')
ORDER BY a
SETTINGS prewarm_mark_cache = 0;

INSERT INTO t_prewarm_cache SELECT
    number,
    rand(),
    rand()
FROM numbers(20000);

SELECT count()
FROM t_prewarm_cache
WHERE NOT ignore(*);

SELECT ProfileEvents['LoadedMarksCount'] > 0
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND like(query, 'SELECT count() FROM t_prewarm_cache%')
ORDER BY event_time_microseconds ASC;