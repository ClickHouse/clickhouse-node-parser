create table test (project LowCardinality(String)) engine=MergeTree() order by project;
select sum(project in ('val1', 'val2')) from test;
set force_primary_key = 1;
select sum(project in ('val1', 'val2')) from test where project in ('val1', 'val2');
select count() from test where project in ('val1', 'val2');
select project in ('val1', 'val2') from test where project in ('val1', 'val2');
