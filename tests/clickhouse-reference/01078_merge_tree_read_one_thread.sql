create table t (a Int, b Int) engine = MergeTree order by (a, b) settings index_granularity = 400;
select sleep(1) format Null; -- sleep a bit to wait possible merges after insert
set max_threads = 1;
select sum(a) from t where a in (0, 3) and b = 0;
