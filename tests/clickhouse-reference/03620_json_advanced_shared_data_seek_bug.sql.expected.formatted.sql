SET use_variant_as_common_type = 1;

CREATE TABLE test
(
    id UInt64,
    json JSON(max_dynamic_paths=2, a.b.c UInt32)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_rows_for_wide_part = 1000000000, min_bytes_for_wide_part = 10000000000, index_granularity = 39547, object_serialization_version = 'v3', object_shared_data_serialization_version = 'advanced', object_shared_data_serialization_version_for_zero_level_parts = 'advanced', object_shared_data_buckets_for_compact_part = 3, object_shared_data_buckets_for_wide_part = 1, dynamic_serialization_version = 'v3';

SELECT json.b.b._1.:String
FROM test
FORMAT Null
SETTINGS max_threads = 1;