create or replace table t1 (n UInt64, s String) engine=MergeTree order by n;
insert into t1 values (1, 'test');
create or replace table t1 (n UInt64, s Nullable(String)) engine=MergeTree order by n;
insert into t1 values (2, null);
select * from t1;
insert into t1 values (3);
