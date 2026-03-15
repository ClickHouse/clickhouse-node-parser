CREATE TABLE index_compact(a UInt32, b UInt32, index i1 b type minmax granularity 1)
    ENGINE = MergeTree ORDER BY a
    SETTINGS min_rows_for_wide_part = 1000, index_granularity = 128, merge_max_block_size = 100;
SELECT count() FROM index_compact WHERE b < 10;
