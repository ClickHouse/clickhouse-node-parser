-- https://github.com/ClickHouse/ClickHouse/issues/23865
SET enable_analyzer=1;
create table table_local engine = Memory AS select * from numbers(10);
create table table_dist engine = Distributed('test_cluster_two_shards', currentDatabase(),table_local) AS table_local;
