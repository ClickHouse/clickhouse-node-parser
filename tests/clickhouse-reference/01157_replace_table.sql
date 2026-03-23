-- Tags: no-ordinary-database

drop table if exists t;
drop table if exists dist;
drop table if exists buf;
drop table if exists join;
create table t (n UInt64, s String default 's' || toString(n)) engine=Memory;
create table dist (n int) engine=Distributed(test_shard_localhost, currentDatabase(), t);
create table buf (n int) engine=Buffer(currentDatabase(), dist, 1, 10, 100, 10, 100, 1000, 1000);
insert into buf values (1);
insert into buf values (2);
insert into buf values (3);
select * from t order by n;
-- table is not created if select fails
create or replace table join engine=Join(ANY, INNER, n) as select * from t where throwIf(n); -- { serverError FUNCTION_THROW_IF_VALUE_IS_NON_ZERO }
select count() from system.tables where database=currentDatabase() and name='join';
-- table is created and filled
create or replace table join engine=Join(ANY, INNER, n) as select * from t;
select * from numbers(10) as t any join join on t.number=join.n order by n;
-- table is not replaced if select fails
insert into t(n) values (4);
select name from system.tables where database=currentDatabase() order by name;
drop table t;
drop table dist;
drop table buf;
drop table join;
