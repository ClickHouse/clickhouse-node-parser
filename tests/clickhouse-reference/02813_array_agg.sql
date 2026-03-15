create table t (n Int32, s String) engine=MergeTree order by n;
select array_agg(s) from t;
select aRray_Agg(s) from t group by n;
