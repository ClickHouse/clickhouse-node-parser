create table t (a Int) engine = MergeTree order by a;
select s from t prewhere a != 1 where rowNumberInBlock() % 2 = 0 limit 1;
