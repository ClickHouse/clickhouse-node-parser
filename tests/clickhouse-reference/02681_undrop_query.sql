-- Tags: no-ordinary-database, no-replicated-database, distributed, zookeeper

set database_atomic_wait_for_drop_and_detach_synchronously = 0;
create table 02681_undrop_mergetree (id Int32) Engine=MergeTree() order by id;
select table from system.dropped_tables where table = '02681_undrop_mergetree' limit 1;
select * from 02681_undrop_mergetree order by id;
create table 02681_undrop_detach (id Int32, num Int32) Engine=MergeTree() order by id;
select command from system.mutations where table='02681_undrop_detach' and database=currentDatabase() limit 1;
create table 02681_undrop_uuid_on_cluster on cluster test_shard_localhost (id Int32) Engine=MergeTree() order by id format Null;
select table from system.dropped_tables where table = '02681_undrop_uuid_on_cluster' limit 1;
select * from 02681_undrop_uuid_on_cluster order by id;
create table 02681_undrop_no_uuid_on_cluster on cluster test_shard_localhost (id Int32) Engine=MergeTree() order by id format Null;
select table from system.dropped_tables where table = '02681_undrop_no_uuid_on_cluster' limit 1;
select * from 02681_undrop_no_uuid_on_cluster order by id;
create table 02681_undrop_replicatedmergetree (id Int32) Engine=ReplicatedMergeTree('/clickhouse/tables/{database}/02681_undrop_replicatedmergetree', 'test_undrop') order by id;
select table from system.dropped_tables where table = '02681_undrop_replicatedmergetree' limit 1;
select * from 02681_undrop_replicatedmergetree order by id;
create table 02681_undrop_log (id Int32) Engine=Log();
select table from system.dropped_tables where table = '02681_undrop_log' limit 1;
select * from 02681_undrop_log order by id;
create table 02681_undrop_distributed (id Int32) Engine = Distributed(test_shard_localhost, currentDatabase(), 02681_undrop, rand());
select table from system.dropped_tables where table = '02681_undrop_distributed' limit 1;
create table 02681_undrop_multiple (id Int32) Engine=MergeTree() order by id;
select table from system.dropped_tables where table = '02681_undrop_multiple' limit 1;
select * from 02681_undrop_multiple order by id;
