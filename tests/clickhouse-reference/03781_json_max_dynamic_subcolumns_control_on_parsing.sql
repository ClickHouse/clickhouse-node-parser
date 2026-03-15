create table test (json JSON) engine=MergeTree order by tuple();
select distinct(arrayJoin(JSONDynamicPaths(json))) as path from test order by path;
