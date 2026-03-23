set prefer_localhost_replica=0;
-- { echoOn }

create table data (key Int) engine=Memory();
create table dist (key Int) engine=Distributed(test_shard_localhost, currentDatabase(), data);
-- check that FLUSH DISTRIBUTED does flushing anyway
insert into dist values (1);
select * from data;
create table dist (key Int) engine=Distributed(test_shard_localhost, currentDatabase(), data) settings flush_on_detach=0;
