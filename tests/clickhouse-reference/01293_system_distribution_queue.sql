-- Tags: no-parallel
set prefer_localhost_replica = 1;
create table null_01293 (key Int) engine=Null();
create table dist_01293 as null_01293 engine=Distributed(test_cluster_two_shards, currentDatabase(), null_01293, key);
-- no rows, since no active monitor
select * from system.distribution_queue where database = currentDatabase();
select is_blocked, error_count, data_files, data_compressed_bytes>100, broken_data_files, broken_data_compressed_bytes from system.distribution_queue where database = currentDatabase();
select is_blocked, error_count, data_files, data_compressed_bytes, broken_data_files, broken_data_compressed_bytes from system.distribution_queue where database = currentDatabase();
