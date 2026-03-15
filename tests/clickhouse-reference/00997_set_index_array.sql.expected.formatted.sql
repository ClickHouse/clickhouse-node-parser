-- Tags: no-random-merge-tree-settings
-- Prevent remote replicas from skipping index analysis in Parallel Replicas. Otherwise, they may return full ranges and trigger max_rows_to_read validation failures.
SET parallel_replicas_index_analysis_only_on_coordinator = 0;

CREATE TABLE set_array
(
    primary_key String,
    index_array Array(UInt64),
    INDEX additional_index_array index_array TYPE set(10000) GRANULARITY 1
)
ENGINE = MergeTree()
ORDER BY (primary_key);

SET max_rows_to_read = 8192;

SELECT count()
FROM set_array
WHERE has(index_array, 333);