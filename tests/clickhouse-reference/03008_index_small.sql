CREATE TABLE test (a UInt8, b UInt8) ENGINE = MergeTree ORDER BY (a, b)
SETTINGS index_granularity = 1, primary_key_ratio_of_unique_prefix_values_to_skip_suffix_columns = 0.01;
SET optimize_move_to_prewhere = 0;
SELECT count() FROM test WHERE b >= 0;
