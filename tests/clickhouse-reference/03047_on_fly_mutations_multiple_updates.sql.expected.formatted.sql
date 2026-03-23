-- Tags: no-random-merge-tree-settings, no-random-settings, no-parallel
-- no-parallel: SYSTEM CLEAR MARK CACHE is used.
SYSTEM DROP  TABLE IF EXISTS t_lightweight_mut_5;

SET apply_mutations_on_fly = 1;

CREATE TABLE t_lightweight_mut_5
(
    id UInt64,
    s1 String,
    s2 String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 0, min_bytes_for_full_part_storage = 0, serialization_info_version = 'basic', storage_policy = 'default';

INSERT INTO t_lightweight_mut_5;

SELECT s1
FROM t_lightweight_mut_5
ORDER BY id ASC;

SELECT s2
FROM t_lightweight_mut_5
ORDER BY id ASC;

SELECT
    s1,
    s2
FROM t_lightweight_mut_5
ORDER BY id ASC;

SELECT
    query,
    ProfileEvents['FileOpen']
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND ilike(query, 'SELECT%FROM t_lightweight_mut_5%')
    AND type = 'QueryFinish'
ORDER BY event_time_microseconds ASC;

SYSTEM DROP  TABLE t_lightweight_mut_5;