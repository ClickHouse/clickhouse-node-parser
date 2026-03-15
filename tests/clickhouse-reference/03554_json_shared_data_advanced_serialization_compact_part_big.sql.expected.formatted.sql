CREATE TABLE test_compact_without_substreams_advanced
(
    json JSON(max_dynamic_paths = 8)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = '200G', min_rows_for_wide_part = 1, write_marks_for_substreams_in_compact_parts = 0, object_serialization_version = 'v3', object_shared_data_serialization_version = 'advanced', object_shared_data_serialization_version_for_zero_level_parts = 'advanced', object_shared_data_buckets_for_compact_part = 2;

SELECT json
FROM test_compact_without_substreams_advanced
FORMAT Null;

CREATE TABLE test_compact_advanced
(
    json JSON(max_dynamic_paths = 8)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = '200G', min_rows_for_wide_part = 1, write_marks_for_substreams_in_compact_parts = 1, object_serialization_version = 'v3', object_shared_data_serialization_version = 'advanced', object_shared_data_serialization_version_for_zero_level_parts = 'advanced', object_shared_data_buckets_for_compact_part = 2;

SELECT json
FROM test_compact_advanced
FORMAT Null;

SELECT json.b
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.b,
    json.c
FROM test_compact_advanced
FORMAT Null;

SELECT json.`arr[]`.arr1
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.`arr[]`.arr1,
    json.`arr[]`.arr2
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.`arr[]`.arr2,
    json.`arr[]`.arr1
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.`arr[]`.arr1,
    json.`arr[]`.arr4
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.`arr[]`.arr4,
    json.`arr[]`.arr1
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.`arr[]`.arr1,
    json.`arr[]`.arr99
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.arr,
    json.`arr[]`.arr1
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.`arr[]`.arr1,
    json.arr
FROM test_compact_advanced
FORMAT Null;

SELECT
    json,
    json.b,
    json.c
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.b,
    json.c,
    json
FROM test_compact_advanced
FORMAT Null;

SELECT
    json,
    json.b,
    json.c,
    json.`arr[]`.arr1
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.b,
    json.c,
    json.`arr[]`.arr1,
    json
FROM test_compact_advanced
FORMAT Null;

SELECT
    json,
    json.b,
    json.c,
    json.arr,
    json.`arr[]`.arr1
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.b,
    json.c,
    json.`arr[]`.arr1,
    json.arr,
    json
FROM test_compact_advanced
FORMAT Null;

SELECT json.`^a`
FROM test_compact_advanced
FORMAT Null;

SELECT
    json,
    json.`^a`
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.`^a`,
    json.a.a1
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.a.a1,
    json.`^a`
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.`^a`,
    json.a.a1,
    json.a.`arr[]`.arr1
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.`^a`
FROM test_compact_advanced
FORMAT Null;

SELECT
    json,
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.`^a`
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.`^a`,
    json
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.`^a`,
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr,
    json.`^a`
FROM test_compact_advanced
FORMAT Null;

SELECT
    json,
    json.`^a`,
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr,
    json.`^a`,
    json
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.`arr[]`.arr1,
    json.`^a`,
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr,
    json.`^a`,
    json.`arr[]`.arr1
FROM test_compact_advanced
FORMAT Null;

SELECT
    json,
    json.`arr[]`.arr1,
    json.`^a`,
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr
FROM test_compact_advanced
FORMAT Null;

SELECT
    json.a.a1,
    json.a.`arr[]`.arr1,
    json.b,
    json.arr,
    json.`^a`,
    json.`arr[]`.arr1,
    json
FROM test_compact_advanced
FORMAT Null;