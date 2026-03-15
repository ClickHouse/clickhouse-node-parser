CREATE TABLE bad_skip_idx
(
  id UInt64,
  value String
) ENGINE MergeTree()
ORDER BY id SETTINGS index_granularity_bytes = 64, min_index_granularity_bytes = 10, vertical_merge_algorithm_min_rows_to_activate = 0, vertical_merge_algorithm_min_columns_to_activate = 0; -- actually vertical merge is not required condition for this bug, but it's more easy to reproduce (becuse we don't recalc granularities)
SELECT COUNT(*) from bad_skip_idx WHERE value = 'xxxxxxxxxx1015'; -- check no exception
