CREATE TABLE test_compact_map
(
    json JSON(max_dynamic_paths=8)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = '200G', min_rows_for_wide_part = 1, write_marks_for_substreams_in_compact_parts = 1, object_serialization_version = 'v3', object_shared_data_serialization_version = 'map', object_shared_data_serialization_version_for_zero_level_parts = 'map';

SELECT json
FROM test_compact_map
FORMAT Null;

SELECT json.b
FROM test_compact_map
FORMAT Null;

SELECT
    json.b,
    json.c
FROM test_compact_map
FORMAT Null;

SELECT
    json,
    json.b,
    json.c
FROM test_compact_map
FORMAT Null;

SELECT
    json.b,
    json.c,
    json
FROM test_compact_map
FORMAT Null;

SELECT json.`^a`
FROM test_compact_map
FORMAT Null;

SELECT
    json,
    json.`^a`
FROM test_compact_map
FORMAT Null;

SELECT
    json.`^a`,
    json.a.a1
FROM test_compact_map
FORMAT Null;

SELECT
    json.a.a1,
    json.`^a`
FROM test_compact_map
FORMAT Null;

CREATE TABLE test_compact_map_tuple
(
    json Tuple(data JSON(max_dynamic_paths=8))
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = '200G', min_rows_for_wide_part = 1, write_marks_for_substreams_in_compact_parts = 1, object_serialization_version = 'v3', object_shared_data_serialization_version = 'map', object_shared_data_serialization_version_for_zero_level_parts = 'map';

SELECT json.data
FROM test_compact_map_tuple
FORMAT Null;

SELECT
    json.data,
    json.data.b
FROM test_compact_map_tuple
FORMAT Null;

SELECT
    json.data.b,
    json.data
FROM test_compact_map_tuple
FORMAT Null;

SELECT
    json.data,
    json.data.b,
    json.data.c
FROM test_compact_map_tuple
FORMAT Null;

SELECT
    json.data.b,
    json.data,
    json.data.c
FROM test_compact_map_tuple
FORMAT Null;

SELECT
    json.data.b,
    json.data.c,
    json.data
FROM test_compact_map_tuple
FORMAT Null;

SELECT
    json.data,
    json.data.`^a`
FROM test_compact_map_tuple
FORMAT Null;

SELECT
    json.data.`^a`,
    json.data
FROM test_compact_map_tuple
FORMAT Null;

SELECT
    json.data,
    json.data.`^a`,
    json.data.b
FROM test_compact_map_tuple
FORMAT Null;

SELECT
    json.data.b,
    json.data.`^a`,
    json.data
FROM test_compact_map_tuple
FORMAT Null;