CREATE TABLE test_wide_map_with_buckets
(
    json JSON(max_dynamic_paths=8)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 1, min_rows_for_wide_part = 1, write_marks_for_substreams_in_compact_parts = 1, object_serialization_version = 'v3', object_shared_data_serialization_version = 'map_with_buckets', object_shared_data_serialization_version_for_zero_level_parts = 'map_with_buckets', object_shared_data_buckets_for_wide_part = 2;

SELECT json
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT json.b
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT json.arr
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json.b,
    json.c
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json.b,
    json.c,
    json.arr
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json,
    json.b,
    json.c
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json,
    json.b,
    json.c,
    json.arr
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json.b,
    json.c,
    json
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json.b,
    json.c,
    json.arr,
    json
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT json.`^a`
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json,
    json.`^a`
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json.`^a`,
    json.a.a1
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json.a.a1,
    json.`^a`
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json.`^a`,
    json.a.a1,
    json.arr
FROM test_wide_map_with_buckets
FORMAT Null;

SELECT
    json.a.a1,
    json.arr,
    json.`^a`
FROM test_wide_map_with_buckets
FORMAT Null;