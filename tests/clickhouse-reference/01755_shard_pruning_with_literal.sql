-- Tags: shard

set optimize_skip_unused_shards=1;
create table data_01755 (i Int) Engine=Memory;
create table dist_01755 as data_01755 Engine=Distributed(test_cluster_two_shards, currentDatabase(), data_01755, i);
select * from dist_01755 where 1 settings enable_early_constant_folding = 0;
