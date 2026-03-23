-- Tags: no-tsan, no-asan, no-msan, no-parallel, no-debug
DROP TABLE IF EXISTS t_patch_join_cache;

CREATE TABLE t_patch_join_cache
(
    a UInt64,
    s String
)
ENGINE = ReplicatedMergeTree('/zookeeper/{database}/t_patch_join_cache/', '1')
ORDER BY a
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1;

SET enable_lightweight_update = 1;

INSERT INTO t_patch_join_cache SELECT
    number,
    ''
FROM numbers(3000000);

SELECT count()
FROM t_patch_join_cache
WHERE s = 'foo'
SETTINGS
    max_threads = 8,
    max_memory_usage = '1Gi';

DROP TABLE t_patch_join_cache;