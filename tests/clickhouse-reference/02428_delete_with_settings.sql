create table test (id Int32, key String) engine=MergeTree() order by tuple() settings index_granularity = 8192, index_granularity_bytes = '10Mi';
insert into test select number, toString(number) from numbers(1000000);
select count() from test;
