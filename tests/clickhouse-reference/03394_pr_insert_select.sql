SET enable_analyzer=1; -- parallel distributed insert select for replicated tables works only with analyzer
SET parallel_distributed_insert_select=2;
CREATE TABLE t_mt_source (k UInt64, v String) ENGINE = MergeTree() ORDER BY k;
CREATE TABLE t_rmt_target (k UInt64, v String) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/t_rmt_target', 'r1') ORDER BY ();
select 'mt source table count()', count() from t_mt_source;
SET enable_parallel_replicas = 1, cluster_for_parallel_replicas = 'test_cluster_one_shard_three_replicas_localhost', max_parallel_replicas = 3;
select '-- check result without local pipeline';
select count() from system.query_log where (current_database = currentDatabase() or has(databases, currentDatabase())) and type = 'QueryFinish' and query_kind = 'Insert' and log_comment='cb01f13a-410c-4985-b233-35289776b58f' and event_date >= yesterday();
select count() from t_rmt_target;
select * from t_rmt_target order by k
except
select * from t_mt_source order by k;
