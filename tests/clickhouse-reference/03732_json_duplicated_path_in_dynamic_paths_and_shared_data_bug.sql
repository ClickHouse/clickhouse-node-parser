create table test (id UInt64, json JSON) engine=MergeTree order by id;
create table test2 (json JSON) engine=MergeTree order by tuple();
select * from test2 format Null;
