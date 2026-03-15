CREATE TABLE test
(
    s String,
    json JSON
)
ENGINE = MergeTree
ORDER BY s
SETTINGS index_granularity = 2, index_granularity_bytes = 0, min_rows_for_wide_part = 0, min_bytes_for_wide_part = 0;

SELECT count()
FROM test
WHERE s = 'a'
    AND isNull(json.a);