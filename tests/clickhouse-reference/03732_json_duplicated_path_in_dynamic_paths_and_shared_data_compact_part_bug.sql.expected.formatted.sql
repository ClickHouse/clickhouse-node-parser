CREATE TABLE test
(
    id UInt64,
    json JSON(max_dynamic_paths=1)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = '100G', write_marks_for_substreams_in_compact_parts = 0;

SELECT json.`^b`
FROM test
ORDER BY id ASC
FORMAT Null;