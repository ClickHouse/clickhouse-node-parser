drop table if exists t;
drop table if exists mv;
create table t engine=Memory empty as select 1;
select count() from t;
create materialized view mv engine=Memory empty as select 1;
select count() from mv;
drop table t;
drop table mv;
