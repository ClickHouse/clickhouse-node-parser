set enable_analyzer=1;
create table t (a UInt64, b UInt64) engine=MergeTree() order by (a);
set optimize_distinct_in_order=1;
select trimBoth(explain) from (explain pipeline select distinct a from t) where explain like '%InOrder%';
