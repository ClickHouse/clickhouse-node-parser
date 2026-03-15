create table test (s String) engine=MergeTree order by tuple() settings min_bytes_for_wide_part=0;
select * from test;
