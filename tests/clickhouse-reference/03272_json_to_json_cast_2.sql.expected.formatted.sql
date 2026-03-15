-- Tags: long
SET enable_json_type = 1;

SET enable_analyzer = 1;

SET output_format_native_write_json_as_string = 0;

CREATE TABLE test
(
    json JSON(max_dynamic_paths = 4)
)
ENGINE = Memory;

SELECT
    json::JSON(max_dynamic_paths=3) AS json2,
    JSONAllPaths(json2),
    JSONSharedDataPaths(json2),
    json2.k1,
    json2.k2,
    json2.k3,
    json2.k4
FROM test;

SELECT
    json::JSON(max_dynamic_paths=2) AS json2,
    JSONAllPaths(json2),
    JSONSharedDataPaths(json2),
    json2.k1,
    json2.k2,
    json2.k3,
    json2.k4
FROM test;

SELECT
    json::JSON(max_dynamic_paths=1) AS json2,
    JSONAllPaths(json2),
    JSONSharedDataPaths(json2),
    json2.k1,
    json2.k2,
    json2.k3,
    json2.k4
FROM test;

SELECT
    json::JSON(max_dynamic_paths=0) AS json2,
    JSONAllPaths(json2),
    JSONSharedDataPaths(json2),
    json2.k1,
    json2.k2,
    json2.k3,
    json2.k4
FROM test;

SET max_block_size = 1000;

SET max_threads = 1;

CREATE TABLE test
(
    id UInt64,
    json JSON(max_dynamic_paths = 4)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_rows_for_wide_part = 1, min_bytes_for_wide_part = 1;

SELECT DISTINCT arrayJoin(JSONAllPaths(json2))
FROM (
        SELECT json::JSON(max_dynamic_paths=3) AS json2
        FROM test
    )
ORDER BY `all` ASC;

SELECT DISTINCT arrayJoin(JSONAllPaths(json2))
FROM (
        SELECT json::JSON(max_dynamic_paths=2) AS json2
        FROM test
    )
ORDER BY `all` ASC;

SELECT DISTINCT arrayJoin(JSONAllPaths(json2))
FROM (
        SELECT json::JSON(max_dynamic_paths=1) AS json2
        FROM test
    )
ORDER BY `all` ASC;

SELECT DISTINCT arrayJoin(JSONAllPaths(json2))
FROM (
        SELECT json::JSON(max_dynamic_paths=0) AS json2
        FROM test
    )
ORDER BY `all` ASC;