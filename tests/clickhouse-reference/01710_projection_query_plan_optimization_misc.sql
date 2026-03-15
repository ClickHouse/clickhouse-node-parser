create table t (x Int32, codectest Int32) engine = MergeTree order by x;
select * from merge('', 't');
