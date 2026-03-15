create table test_10m (key Int, value Int) engine=MergeTree() order by key partition by key % 200 settings distributed_index_analysis_min_parts_to_activate=0, distributed_index_analysis_min_indexes_size_to_activate=0;
set allow_experimental_parallel_reading_from_replicas=0;
set parallel_replicas_for_non_replicated_merge_tree=1;
set parallel_replicas_index_analysis_only_on_coordinator=1;
set parallel_replicas_local_plan=1;
set distributed_index_analysis=1;
set max_parallel_replicas=100;
set cluster_for_parallel_replicas='parallel_replicas';
--- Ignore warnings when replica does not respond, and analysis is done on initiator
set send_logs_level='error';
-- { echo }
select sum(key) from test_10m;
select sum(key) from test_10m where key = 1;
select
  normalizeQuery(query) q,
  ProfileEvents['DistributedIndexAnalysisMicroseconds'] > 0 not_blazingly_fast,
  ProfileEvents['DistributedIndexAnalysisMissingParts'] missing_parts,
  ProfileEvents['DistributedIndexAnalysisScheduledReplicas'] replicas,
  ProfileEvents['DistributedIndexAnalysisFailedReplicas'] > 0 failed_replicas
from system.query_log
where
  current_database = currentDatabase()
  and event_date >= yesterday()
  and type != 'QueryStart'
  and query_kind = 'Select'
  and is_initial_query
  and Settings['distributed_index_analysis'] = '1'
  and endsWith(log_comment, '-' || currentDatabase())
order by event_time_microseconds
format Vertical;
