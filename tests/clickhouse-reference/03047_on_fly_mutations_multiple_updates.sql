SET apply_mutations_on_fly = 1;
CREATE TABLE t_lightweight_mut_5 (id UInt64, s1 String, s2 String)
ENGINE = MergeTree ORDER BY id
SETTINGS min_bytes_for_wide_part = 0,
    min_bytes_for_full_part_storage = 0,
    serialization_info_version = 'basic',
    storage_policy = 'default';
SELECT s1 FROM t_lightweight_mut_5 ORDER BY id;
SELECT s2 FROM t_lightweight_mut_5 ORDER BY id;
SELECT s1, s2 FROM t_lightweight_mut_5 ORDER BY id;
SELECT query, ProfileEvents['FileOpen'] FROM system.query_log
WHERE
    current_database = currentDatabase()
    AND query ILIKE 'SELECT%FROM t_lightweight_mut_5%'
    AND type = 'QueryFinish'
ORDER BY event_time_microseconds;
