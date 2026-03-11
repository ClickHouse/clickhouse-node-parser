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
