create table data_01670 (key Int) engine=Null();
create table dist_01670 (key Int) engine=Distributed(test_shard_localhost, currentDatabase(), data_01670) settings bytes_to_throw_insert=1;
