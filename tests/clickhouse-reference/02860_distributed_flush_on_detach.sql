set prefer_localhost_replica=0;
drop table if exists data;
drop table if exists dist;
-- { echoOn }

create table data (key Int) engine=Memory();
create table dist (key Int) engine=Distributed(test_shard_localhost, currentDatabase(), data);
-- check that FLUSH DISTRIBUTED does flushing anyway
insert into dist values (1);
select * from data;
truncate table data;
-- check flush_on_detach=0
drop table dist;
create table dist (key Int) engine=Distributed(test_shard_localhost, currentDatabase(), data) settings flush_on_detach=0;
