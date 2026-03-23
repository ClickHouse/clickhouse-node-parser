-- Tags: no-parallel

create database if not exists shard_0;
create database if not exists shard_1;
drop table if exists shard_0.from_1;
drop table if exists shard_1.from_1;
drop table if exists shard_0.to;
drop table if exists shard_1.to;
create table shard_0.from_1 (x UInt32) engine = ReplicatedMergeTree('/clickhouse/tables/from_1_' || currentDatabase(), '0') order by x settings old_parts_lifetime=1, max_cleanup_delay_period=1, cleanup_delay_period=1, shared_merge_tree_disable_merges_and_mutations_assignment=1;
create table shard_1.from_1 (x UInt32) engine = ReplicatedMergeTree('/clickhouse/tables/from_1_' || currentDatabase(), '1') order by x settings old_parts_lifetime=1, max_cleanup_delay_period=1, cleanup_delay_period=1, shared_merge_tree_disable_merges_and_mutations_assignment=1;
insert into shard_0.from_1 select number + 20 from numbers(10);
insert into shard_0.from_1 select number + 30 from numbers(10);
insert into shard_0.from_1 select number + 40 from numbers(10);
insert into shard_0.from_1 select number + 50 from numbers(10);
create table shard_0.to (x UInt32) engine = ReplicatedMergeTree('/clickhouse/tables/to_' || currentDatabase(), '0') order by x settings old_parts_lifetime=1, max_cleanup_delay_period=1, cleanup_delay_period=1, max_parts_to_merge_at_once=2, shared_merge_tree_disable_merges_and_mutations_assignment=1;
create table shard_1.to (x UInt32) engine = ReplicatedMergeTree('/clickhouse/tables/to_' || currentDatabase(), '1') order by x settings old_parts_lifetime=1, max_cleanup_delay_period=1, cleanup_delay_period=1, max_parts_to_merge_at_once=2;
select name, active from system.parts where database='shard_0' and table='to' and active order by name;
-- If moved parts are not merged by OPTIMIZE or background merge restart
-- can log Warning about metadata version on disk. It's normal situation
-- and test shouldn't rarely fail because of it.
set send_logs_level = 'error';
-- Doesn't lead to test flakyness, because we don't check content in table
-- which doesn't depend on any background operation
select sleep(3);
select count(), sum(x) from shard_1.to;
