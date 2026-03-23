create table test (s String) engine=MergeTree order by tuple() settings min_bytes_for_wide_part=0;
insert into test select 'str' from numbers(1);
select * from test;
