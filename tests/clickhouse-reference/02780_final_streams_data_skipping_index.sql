CREATE TABLE data
(
    key  Int,
    v1   DateTime,
    INDEX v1_index v1 TYPE minmax GRANULARITY 1
) ENGINE=AggregatingMergeTree()
ORDER BY key
SETTINGS index_granularity=8192, min_bytes_for_wide_part=0, min_rows_for_wide_part=0;
SET optimize_on_insert = 0;
