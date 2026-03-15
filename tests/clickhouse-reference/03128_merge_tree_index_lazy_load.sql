CREATE TABLE t_index_lazy_load (a UInt64, b UInt64)
ENGINE = MergeTree ORDER BY (a, b)
SETTINGS index_granularity = 4, primary_key_ratio_of_unique_prefix_values_to_skip_suffix_columns = 0.5;
SELECT mark_number, a, b FROM mergeTreeIndex(currentDatabase(), t_index_lazy_load) ORDER BY mark_number;
