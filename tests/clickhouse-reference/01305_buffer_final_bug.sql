create table t (x UInt64) engine = MergeTree order by (x, intHash64(x)) sample by intHash64(x);
create table t_buf as t engine = Buffer(currentDatabase(), 't', 16, 20, 100, 100000, 10000000, 50000000, 250000000);
select count() from t_buf sample 1/2 format Null;
