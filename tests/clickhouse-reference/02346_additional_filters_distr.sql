-- Tags: no-parallel, distributed

create database if not exists shard_0;
create database if not exists shard_1;
create table shard_0.data_02346 (x UInt32, y String) engine = MergeTree order by x settings index_granularity = 2;
create table shard_1.data_02346 (x UInt32, y String) engine = MergeTree order by x settings index_granularity = 2;
create table dist_02346 (x UInt32, y String) engine=Distributed('test_cluster_two_shards_different_databases', /* default_database= */ '', data_02346);
set max_rows_to_read=4;
select * from dist_02346 order by x settings additional_table_filters={'dist_02346' : 'x > 3 and x < 7'};
