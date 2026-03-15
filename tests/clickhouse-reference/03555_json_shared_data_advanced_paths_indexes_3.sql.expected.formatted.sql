-- Tags: no-s3-storage, long, no-msan, no-tsan, no-asan, no-ubsan
SET output_format_json_quote_64bit_integers = 0;

CREATE TABLE test
(
    json JSON(max_dynamic_paths=0)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 1, min_bytes_for_wide_part = 1, min_rows_for_wide_part = 1, object_serialization_version = 'v3', object_shared_data_serialization_version = 'advanced', object_shared_data_serialization_version_for_zero_level_parts = 'advanced', object_shared_data_buckets_for_wide_part = 1;

SELECT sipHash64(json::String)
FROM test
ORDER BY `all` ASC;