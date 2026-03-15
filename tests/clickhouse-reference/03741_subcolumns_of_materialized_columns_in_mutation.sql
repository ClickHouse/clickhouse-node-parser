create table test (s String, json JSON materialized s) engine=MergeTree order by tuple();
select * from test;
