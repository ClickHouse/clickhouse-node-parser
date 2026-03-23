create table t_00712_1 (a Int32, b Int32) engine = MergeTree partition by (a,b) order by (a);
insert into t_00712_1 values (1, 1);
select b from t_00712_1 prewhere a < 1000;
select c from t_00712_1 where a < 1000;
select c from t_00712_1 prewhere a < 1000;
