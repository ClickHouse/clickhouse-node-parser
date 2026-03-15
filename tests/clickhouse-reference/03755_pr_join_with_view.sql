create table t0 (k UInt64, v String) engine ReplicatedMergeTree('/clickhouse/{database}/t0', '0') order by tuple();
create table t1 (k UInt64, v String) engine ReplicatedMergeTree('/clickhouse/{database}/t1', '0') order by tuple();
CREATE VIEW v AS SELECT * FROM t0;
SET enable_parallel_replicas=1, max_parallel_replicas=3, cluster_for_parallel_replicas='test_cluster_one_shard_three_replicas_localhost';
