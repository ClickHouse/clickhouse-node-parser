drop table if exists v;
drop table if exists t0 sync;
drop table if exists t1 sync;
create table t0 (k UInt64, v String) engine ReplicatedMergeTree('/clickhouse/{database}/t0', '0') order by tuple();
create table t1 (k UInt64, v String) engine ReplicatedMergeTree('/clickhouse/{database}/t1', '0') order by tuple();
CREATE VIEW v AS SELECT * FROM t0;
insert into t0 select number, toString(number) from numbers(10);
insert into t1 select number, toString(number + 100) from numbers(10);
SET enable_parallel_replicas=1, max_parallel_replicas=3, cluster_for_parallel_replicas='test_cluster_one_shard_three_replicas_localhost';
