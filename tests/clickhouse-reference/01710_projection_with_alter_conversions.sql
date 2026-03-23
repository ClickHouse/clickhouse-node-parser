create table t (i int, j int, projection p (select i order by i)) engine MergeTree order by tuple();
insert into t values (1, 2);
set alter_sync = 0;
select * from t;
