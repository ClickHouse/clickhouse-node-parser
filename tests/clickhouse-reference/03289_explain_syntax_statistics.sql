create table data_01247 as system.numbers engine=Memory();
create table dist_01247 as data_01247 engine=Distributed(test_cluster_two_shards, currentDatabase(), data_01247, number);
set use_statistics = 1;
