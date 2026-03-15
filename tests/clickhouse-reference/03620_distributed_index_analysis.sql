create table test_10m (key Int, value Int) engine=MergeTree() order by key settings distributed_index_analysis_min_parts_to_activate=0, distributed_index_analysis_min_indexes_size_to_activate=0;
set allow_experimental_parallel_reading_from_replicas=0;
set cluster_for_parallel_replicas='';
select groupArraySortedDistinct(10)(_part), sum(key) from test_10m settings distributed_index_analysis=1; -- { serverError CLUSTER_DOESNT_EXIST }
--- Ignore warnings when replica does not respond, and analysis is done on initiator
set send_logs_level='error';
-- { echo }
select groupArraySortedDistinct(10)(_part), sum(key) from test_10m settings distributed_index_analysis=0;
select groupArraySortedDistinct(10)(_part), sum(key) from test_10m settings cluster_for_parallel_replicas='parallel_replicas', distributed_index_analysis=1;
select format(
  'distributed_index_analysis={}, DistributedIndexAnalysisMicroseconds>0={}, DistributedIndexAnalysisMissingParts={}, DistributedIndexAnalysisScheduledReplicas={}, DistributedIndexAnalysisFailedReplicas>0={}',
  Settings['distributed_index_analysis'],
  ProfileEvents['DistributedIndexAnalysisMicroseconds'] > 0,
  ProfileEvents['DistributedIndexAnalysisMissingParts'],
  ProfileEvents['DistributedIndexAnalysisScheduledReplicas'],
  ProfileEvents['DistributedIndexAnalysisFailedReplicas'] > 0
)
from system.query_log
where
  current_database = currentDatabase()
  and event_date >= yesterday()
  and type = 'QueryFinish'
  and query_kind = 'Select'
  and is_initial_query
  and has(Settings, 'allow_experimental_parallel_reading_from_replicas')
  and endsWith(log_comment, '-' || currentDatabase())
order by event_time_microseconds;
