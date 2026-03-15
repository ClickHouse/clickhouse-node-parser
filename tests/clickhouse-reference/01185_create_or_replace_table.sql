create or replace table t1 (n UInt64, s String) engine=MergeTree order by n;
create or replace table t1 (n UInt64, s Nullable(String)) engine=MergeTree order by n;
select * from t1;
