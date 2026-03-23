create table data_01670 (key Int) engine=Null();
create table dist_01670 (key Int) engine=Distributed(test_shard_localhost, currentDatabase(), data_01670) settings bytes_to_throw_insert=1;
-- first batch is always OK, since there is no pending bytes yet
insert into dist_01670 select * from numbers(1) settings prefer_localhost_replica=0;
