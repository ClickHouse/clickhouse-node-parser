SET enable_json_type = 1;

CREATE TABLE test
(
    json JSON(max_dynamic_paths = 1)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_rows_for_wide_part = 1, min_bytes_for_wide_part = 1;

SELECT DISTINCT
    dynamicType(json.b) AS type,
    isDynamicElementInSharedData(json.b)
FROM test
ORDER BY type ASC;