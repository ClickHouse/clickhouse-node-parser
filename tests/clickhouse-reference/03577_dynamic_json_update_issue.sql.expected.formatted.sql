SET mutations_sync = 1;

CREATE TABLE test_updates
(
    id UInt64,
    json JSON
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_rows_for_wide_part = 1, min_bytes_for_wide_part = 1, index_granularity = 5, index_granularity_bytes = '10Mi';

SELECT *
FROM test_updates;