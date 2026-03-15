set mutations_sync = 2;
create table t_delete_skip_index (x UInt32, y String, index i y type minmax granularity 3) engine = MergeTree order by tuple() SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
select count() from t_delete_skip_index where y in (4, 5);
create table t_delete_projection (x UInt32, y UInt64, projection p (select sum(y))) engine = MergeTree order by tuple() SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
select sum(y) from t_delete_projection settings optimize_use_projections = 0;
select sum(y) from t_delete_projection settings optimize_use_projections = 0, force_optimize_projection = 1;
