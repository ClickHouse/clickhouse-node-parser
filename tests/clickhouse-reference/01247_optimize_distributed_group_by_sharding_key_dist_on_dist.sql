-- Tags: distributed

-- TODO: correct testing with real unique shards

set optimize_distributed_group_by_sharding_key=1;
create table data_01247 as system.numbers engine=Memory();
set max_distributed_connections=1;
set optimize_skip_unused_shards=1;
create table dist_layer_01247 as data_01247 engine=Distributed(test_cluster_two_shards, currentDatabase(), data_01247, number);
create table dist_01247 as data_01247 engine=Distributed(test_cluster_two_shards, currentDatabase(), dist_layer_01247, number);
select count(), * from dist_01247 group by number order by number limit 1 settings prefer_localhost_replica=1;
-- Now, sharding key optimization is not supported for distributed over distributed with serialized plan.
select count(), * from dist_01247 group by number order by number limit 1 settings prefer_localhost_replica=0, serialize_query_plan=1, enable_analyzer=1;
create table dist_01247 as data_01247 engine=Distributed(test_cluster_two_shards, currentDatabase(), dist_layer_01247, rand());
select count(), * from dist_01247 group by number order by number limit 1;
create table dist_layer_01247 as data_01247 engine=Distributed(test_cluster_two_shards, currentDatabase(), data_01247, rand());
