CREATE TABLE data_01513
(
    key String
)
ENGINE = MergeTree()
ORDER BY key;

-- this is enough to trigger non-reusable Chunk in Arena.
SET max_memory_usage = '500M';

SET max_threads = 1;

SET max_block_size = 500;

SET max_bytes_before_external_group_by = 0;

SET max_bytes_ratio_before_external_group_by = 0;

SELECT
    key,
    groupArray(repeat('a', 200)),
    count()
FROM data_01513
GROUP BY key
FORMAT Null
SETTINGS optimize_aggregation_in_order = 0; -- { serverError MEMORY_LIMIT_EXCEEDED }

SELECT
    key,
    groupArray(repeat('a', 200)),
    count()
FROM data_01513
GROUP BY key
FORMAT Null
SETTINGS optimize_aggregation_in_order = 1;

-- for WITH TOTALS previous groups should be kept.
SELECT
    key,
    groupArray(repeat('a', 200)),
    count()
FROM data_01513
GROUP BY key
WITH TOTALS
FORMAT Null
SETTINGS optimize_aggregation_in_order = 1; -- { serverError MEMORY_LIMIT_EXCEEDED }