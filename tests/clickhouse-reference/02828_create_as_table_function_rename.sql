drop table if exists t1;
create table t1 as remote('localhost', 'system.one');
select * from t2;
drop table t1;
