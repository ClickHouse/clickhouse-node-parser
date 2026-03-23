SET apply_mutations_on_fly = 1;

SET enable_filesystem_cache = 0;

SET read_through_distributed_cache = 0;

CREATE TABLE t_lightweight_mut_5
(
    id UInt64,
    s1 String,
    s2 String
)
ENGINE = ReplicatedMergeTree('/clickhouse/zktest/tables/{database}/t_lightweight_mut_1', '1')
ORDER BY id
SETTINGS min_bytes_for_wide_part = 0, min_bytes_for_full_part_storage = 0, primary_key_lazy_load = 0, serialization_info_version = 'basic', storage_policy = 's3_cache';

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
    ProfileEvents['S3GetObject']
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND ilike(query, 'SELECT%FROM t_lightweight_mut_5%')
    AND type = 'QueryFinish'
ORDER BY event_time_microseconds ASC;