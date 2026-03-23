create table t0 (key Int) engine=MergeTree order by () settings auto_statistics_types='';
create table t1 (key Int) engine=MergeTree order by () settings auto_statistics_types='';
insert into t0 values (1);
insert into t1 values (1);
