CREATE TABLE t0
(
    c0 Tuple(Int256, String)
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0;

SET allow_prefetched_read_pool_for_local_filesystem = 1, filesystem_prefetch_max_memory_usage = 4096, max_threads = 4;

SELECT *
FROM t0
FORMAT Null;