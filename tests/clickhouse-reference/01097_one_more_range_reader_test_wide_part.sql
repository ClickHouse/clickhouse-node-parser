create table t (id UInt32, a Int) engine = MergeTree order by id settings min_bytes_for_wide_part=0;
select s from t prewhere a = 1;
