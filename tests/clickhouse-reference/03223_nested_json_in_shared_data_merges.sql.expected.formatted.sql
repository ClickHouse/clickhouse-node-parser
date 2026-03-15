SET enable_json_type = 1;

CREATE TABLE test
(
    json JSON(max_dynamic_paths = 8)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 1, min_rows_for_wide_part = 1;

SELECT JSONAllPaths(arrayJoin(json.`a[]`))
FROM test;

SELECT JSONDynamicPaths(arrayJoin(json.`a[]`))
FROM test;

SELECT JSONSharedDataPaths(arrayJoin(json.`a[]`))
FROM test;