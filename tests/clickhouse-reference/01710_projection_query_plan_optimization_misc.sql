create table t (x Int32, codectest Int32) engine = MergeTree order by x;
insert into t values (1, 2);
select * from merge('', 't');
