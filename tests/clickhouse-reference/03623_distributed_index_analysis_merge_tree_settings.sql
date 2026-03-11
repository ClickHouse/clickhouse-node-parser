select sum(key) from dist_idx settings distributed_index_analysis=1 format Null;
select sum(key) from no_dist_idx_not_enough_indexes settings distributed_index_analysis=1 format Null;
select sum(key) from no_dist_idx_min_not_enough_parts settings distributed_index_analysis=1 format Null;
select sum(key) from no_dist_idx settings distributed_index_analysis=1 format Null;
select sum(key) from dist_idx_parts settings distributed_index_analysis=1 format Null;
select table, sum(primary_key_size) from system.parts where database = currentDatabase() AND table = 'dist_idx_pk_size' group by 1;
select key from dist_idx_pk_size settings distributed_index_analysis=1 format Null;
select table, sum(data_uncompressed_bytes) from system.data_skipping_indices where database = currentDatabase() AND table = 'dist_idx_skipping_idx_size' group by 1;
select key from dist_idx_skipping_idx_size settings distributed_index_analysis=1 format Null;
select tables, ProfileEvents['DistributedIndexAnalysisMicroseconds'] > 0
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
