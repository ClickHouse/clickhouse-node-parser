create table data_01223 (key Int) Engine=Memory();
create table dist_layer_01223 as data_01223 Engine=Distributed(test_cluster_two_shards, currentDatabase(), data_01223);
create table dist_01223 as data_01223 Engine=Distributed(test_cluster_two_shards, currentDatabase(), dist_layer_01223);
select * from dist_01223;
select distinct * from dist_01223 order by key;
select * from dist_01223 group by key order by key;
select * from dist_01223 group by key order by key limit 1;
select * from dist_01223 having key = 1;
select * from dist_01223 group by key having key = 1;
select * from dist_01223 order by key;
select * from dist_01223 order by key limit 1;
select * from dist_01223 order by key limit 1 by key;
select * from cluster(test_cluster_two_shards, currentDatabase(), dist_01223) order by key;
select * from cluster(test_cluster_two_shards, currentDatabase(), dist_01223) group by key order by key;
select a.key, b.key from (SELECT toInt32(number) key from numbers(2)) a left join (select distinct * from dist_01223) b using key order by b.key;
select a.key, b.key from (SELECT toInt32(number) key from numbers(2)) a right join (select distinct * from dist_01223) b using key order by b.key;
select * from dist_01223 group by key order by key settings
group_by_two_level_threshold=1,
group_by_two_level_threshold_bytes=1;
select * from dist_01223 group by key order by key settings
distributed_aggregation_memory_efficient=1;
select * from dist_01223 group by key order by key settings
group_by_two_level_threshold=1,
group_by_two_level_threshold_bytes=1,
distributed_aggregation_memory_efficient=1;
select count() from dist_01223;
select count() from dist_01223 settings distributed_group_by_no_merge=1;
create table dist_layer_01223 as data_01223 Engine=Distributed(test_shard_localhost, currentDatabase(), data_01223);
create table merge_dist_01223 as dist_01223 engine=Merge(currentDatabase(), 'dist_01223');
select count() from merge_dist_01223;
select count() from merge_dist_01223 settings distributed_group_by_no_merge=1;
select distinct * from dist_01223 where key global in (select toInt32(1));
