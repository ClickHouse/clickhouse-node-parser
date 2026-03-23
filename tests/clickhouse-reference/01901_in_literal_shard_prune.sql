-- Tags: shard

set optimize_skip_unused_shards=1;
set force_optimize_skip_unused_shards=1;
create table d (i UInt8) Engine=Memory;
create table dp as d Engine=Distributed(test_cluster_two_shards, currentDatabase(), d, i);
insert into d values (1), (2);
select * from dp where i in (1);
