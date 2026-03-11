select sum(key) from test_10m settings distributed_index_analysis=1, distributed_index_analysis_for_non_shared_merge_tree=0 format Null;
select sum(key) from test_10m settings distributed_index_analysis=1, distributed_index_analysis_for_non_shared_merge_tree=1 format Null;
select format(
  'distributed_index_analysis_for_non_shared_merge_tree={}, DistributedIndexAnalysisMicroseconds>0={}',
  Settings['distributed_index_analysis_for_non_shared_merge_tree'],
  ProfileEvents['DistributedIndexAnalysisMicroseconds'] > 0
)
from system.query_log
where
  current_database = currentDatabase()
  and event_date >= yesterday()
  and type = 'QueryFinish'
  and query_kind = 'Select'
  and is_initial_query
  and has(Settings, 'distributed_index_analysis')
  and endsWith(log_comment, '-' || currentDatabase())
order by event_time_microseconds;
