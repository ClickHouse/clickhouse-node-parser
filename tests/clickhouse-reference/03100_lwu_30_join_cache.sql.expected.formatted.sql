CREATE TABLE t_patch_join_cache
(
    a UInt64,
    s String
)
ENGINE = ReplicatedMergeTree('/zookeeper/{database}/t_patch_join_cache/', '1')
ORDER BY a
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1;

SET enable_lightweight_update = 1;

SELECT count()
FROM t_patch_join_cache
WHERE s = 'foo'
SETTINGS
    max_threads = 8,
    max_memory_usage = '1Gi';