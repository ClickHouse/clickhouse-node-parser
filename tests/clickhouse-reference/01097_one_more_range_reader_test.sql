create table t (id UInt32, a Int) engine = MergeTree order by id;
select s from t prewhere a = 1;
