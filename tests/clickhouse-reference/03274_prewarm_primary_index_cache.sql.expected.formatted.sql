-- Tags: no-parallel, no-shared-merge-tree
DROP TABLE IF EXISTS t_prewarm_cache_rmt_1;

DROP TABLE IF EXISTS t_prewarm_cache_rmt_2;

CREATE TABLE t_prewarm_cache_rmt_1
(
    a UInt64,
    b UInt64,
    c UInt64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/03274_prewarm_mark_cache_smt/t_prewarm_cache', '1')
ORDER BY a
PARTITION BY a % 2
SETTINGS prewarm_primary_key_cache = 1, use_primary_key_cache = 1;

CREATE TABLE t_prewarm_cache_rmt_2
(
    a UInt64,
    b UInt64,
    c UInt64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/03274_prewarm_mark_cache_smt/t_prewarm_cache', '2')
ORDER BY a
PARTITION BY a % 2
SETTINGS prewarm_primary_key_cache = 1, use_primary_key_cache = 1;

-- Check that prewarm works on insert.
INSERT INTO t_prewarm_cache_rmt_1 SELECT
    number,
    rand(),
    rand()
FROM numbers(20000);

SELECT count()
FROM t_prewarm_cache_rmt_1
WHERE a % 2 = 0
    AND a > 100
    AND a < 1000;

SELECT sum(primary_key_bytes_in_memory)
FROM `system`.parts
WHERE database = currentDatabase()
    AND table IN ('t_prewarm_cache_rmt_1', 't_prewarm_cache_rmt_2');

SELECT count()
FROM t_prewarm_cache_rmt_2
WHERE a % 2 = 0
    AND a > 100
    AND a < 1000;

SELECT ProfileEvents['LoadedPrimaryIndexFiles']
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND like(query, 'SELECT count() FROM t_prewarm_cache%')
ORDER BY event_time_microseconds ASC;