-- Tags: distributed, no-parallel

set send_logs_level = 'error';
create database if not exists shard_0;
create database if not exists shard_1;
create table shard_0.shard_01231_distributed_aggregation_memory_efficient (x UInt64) engine = MergeTree order by x;
create table shard_1.shard_01231_distributed_aggregation_memory_efficient (x UInt64) engine = MergeTree order by x;
create table ma_dist (x UInt64) ENGINE =  Distributed(test_cluster_two_shards_different_databases, '', 'shard_01231_distributed_aggregation_memory_efficient');
set distributed_aggregation_memory_efficient = 1;
set group_by_two_level_threshold = 2;
set max_bytes_before_external_group_by = 16;
set max_bytes_ratio_before_external_group_by = 0;
select x, count() from ma_dist group by x order by x;
select arrayFilter(y -> y = x, [x]) as f from ma_dist order by f;
