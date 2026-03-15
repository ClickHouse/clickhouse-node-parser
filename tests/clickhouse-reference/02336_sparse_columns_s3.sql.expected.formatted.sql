CREATE TABLE t_sparse_s3
(
    id UInt32,
    cond UInt8,
    s String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.01, storage_policy = 's3_cache', min_bytes_for_wide_part = 0, min_compress_block_size = 1, serialization_info_version = 'basic', index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT serialization_kind
FROM `system`.parts_columns
WHERE table = 't_sparse_s3'
    AND active
    AND column = 's'
    AND database = currentDatabase();

SET max_threads = 1;

SELECT count()
FROM t_sparse_s3
PREWHERE cond
WHERE id IN (1, 3, 5, 7, 9, 11, 13, 15, 17)
    AND NOT ignore(s);