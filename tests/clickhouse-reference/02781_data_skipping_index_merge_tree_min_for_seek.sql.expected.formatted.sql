SELECT *
FROM data
WHERE v1 >= now() - toIntervalDay(180)
FORMAT Null
SETTINGS max_threads = 1, max_final_threads = 1, force_data_skipping_indices = 'v1_index', merge_tree_min_rows_for_seek = 0, max_rows_to_read = 1999999, parallel_replicas_index_analysis_only_on_coordinator = 0;

SELECT *
FROM data
WHERE v1 >= now() - toIntervalDay(180)
FORMAT Null
SETTINGS max_threads = 1, max_final_threads = 1, force_data_skipping_indices = 'v1_index', merge_tree_min_rows_for_seek = 1, max_rows_to_read = 1999999, parallel_replicas_index_analysis_only_on_coordinator = 0;