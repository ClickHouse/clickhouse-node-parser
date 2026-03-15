create table data_01643 (key Int) engine=Memory();
create table dist_01643 as data_01643 engine=Distributed(test_cluster_two_shards, currentDatabase(), data_01643, key);
select sum(*) from dist_01643;
create table dist_01643 as data_01643 engine=Distributed(test_cluster_two_shards, currentDatabase(), data_01643, key) settings fsync_after_insert=1, fsync_directories=1;
