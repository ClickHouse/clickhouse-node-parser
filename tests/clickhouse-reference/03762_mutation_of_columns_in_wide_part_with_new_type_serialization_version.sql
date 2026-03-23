create table test (s String) engine=MergeTree order by tuple() settings min_bytes_for_wide_part=1, string_serialization_version='single_stream';
insert into test select 'abc' || toString(number) from numbers(100);
select max(s), max(s1) from test;
