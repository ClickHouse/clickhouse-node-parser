SELECT sum(key)
FROM test_10m
SETTINGS
    distributed_index_analysis = 1,
    distributed_index_analysis_for_non_shared_merge_tree = 0
FORMAT Null;

SELECT sum(key)
FROM test_10m
SETTINGS
    distributed_index_analysis = 1,
    distributed_index_analysis_for_non_shared_merge_tree = 1
FORMAT Null;

SELECT format('distributed_index_analysis_for_non_shared_merge_tree={}, DistributedIndexAnalysisMicroseconds>0={}', `Settings`['distributed_index_analysis_for_non_shared_merge_tree'], ProfileEvents['DistributedIndexAnalysisMicroseconds'] > 0)
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND event_date >= yesterday()
    AND type = 'QueryFinish'
    AND query_kind = 'Select'
    AND is_initial_query
    AND has(`Settings`, 'distributed_index_analysis')
    AND endsWith(log_comment, concat('-', currentDatabase()))
ORDER BY event_time_microseconds ASC;