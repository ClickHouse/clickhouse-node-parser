CREATE TABLE test_wide_advanced_tuple
(
    json Tuple(data JSON(max_dynamic_paths = 8))
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 1, min_rows_for_wide_part = 1, write_marks_for_substreams_in_compact_parts = 1, object_serialization_version = 'v3', object_shared_data_serialization_version = 'advanced', object_shared_data_serialization_version_for_zero_level_parts = 'advanced', object_shared_data_buckets_for_wide_part = 2;

SELECT json.data
FROM test_wide_advanced_tuple
FORMAT Null;

SELECT
    json.data,
    json.data.b
FROM test_wide_advanced_tuple
FORMAT Null;

SELECT
    json.data.b,
    json.data
FROM test_wide_advanced_tuple
FORMAT Null;

SELECT
    json.data,
    json.data.b,
    json.data.c
FROM test_wide_advanced_tuple
FORMAT Null;

SELECT
    json.data.b,
    json.data,
    json.data.c
FROM test_wide_advanced_tuple
FORMAT Null;

SELECT
    json.data.b,
    json.data.c,
    json.data
FROM test_wide_advanced_tuple
FORMAT Null;

SELECT
    json.data,
    json.data.`^a`
FROM test_wide_advanced_tuple
FORMAT Null;

SELECT
    json.data.`^a`,
    json.data
FROM test_wide_advanced_tuple
FORMAT Null;

SELECT
    json.data,
    json.data.`^a`,
    json.data.b
FROM test_wide_advanced_tuple
FORMAT Null;

SELECT
    json.data.b,
    json.data.`^a`,
    json.data
FROM test_wide_advanced_tuple
FORMAT Null;