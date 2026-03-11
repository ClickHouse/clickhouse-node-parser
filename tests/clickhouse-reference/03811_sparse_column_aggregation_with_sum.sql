SELECT key, sum(val) AS c
FROM 03811_sparse_column_aggregation_with_sum
GROUP BY key
ORDER BY c DESC
LIMIT 100
FORMAT Null
SETTINGS group_by_overflow_mode = 'any',
         max_rows_to_group_by = 100,
         group_by_two_level_threshold_bytes = 1,
         group_by_two_level_threshold = 1,
         max_threads = 2;
