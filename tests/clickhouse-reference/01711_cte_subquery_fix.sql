create table t engine = Memory as with cte as (select * from numbers(10)) select * from cte;
create view view1 as with t as (select number n from numbers(3)) select n from t;
