drop table if exists test_01081;
create table test_01081 (key Int) engine=MergeTree() order by key;
insert into test_01081 select * from system.numbers limit 10;
select 1 from remote('127.{1,2}', currentDatabase(), test_01081) lhs join system.one as rhs on rhs.dummy = 1 order by 1
SETTINGS enable_analyzer = 0; -- { serverError INVALID_JOIN_ON_EXPRESSION }
select 1 from remote('127.{1,2}', currentDatabase(), test_01081) lhs join system.one as rhs on rhs.dummy = 1 order by 1
SETTINGS enable_analyzer = 1;
