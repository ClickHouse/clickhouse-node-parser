-- Disable cache for s3 storage tests because it increases memory usage.
SET enable_filesystem_cache = 0;

SET remote_filesystem_read_method = 'read';

SET local_filesystem_read_method = 'pread';

CREATE TABLE data_01641
(
    key Int,
    value String
)
ENGINE = MergeTree
ORDER BY (key, repeat(value, 40))
SETTINGS old_parts_lifetime = 0, min_bytes_for_wide_part = 0;

SET max_block_size = 1000, min_insert_block_size_rows = 0, min_insert_block_size_bytes = 0;

SET max_memory_usage = '10Mi', max_untracked_memory = 0;