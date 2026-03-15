create table t (n int) engine MergeTree order by n;
select 1 from t group by 1;
