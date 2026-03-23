-- Tags: no-fasttest

SET enable_json_type = 1;
set allow_experimental_dynamic_type = 1;
create table test (json JSON(a Dynamic)) engine=MergeTree order by tuple() settings min_rows_for_wide_part=1, min_bytes_for_wide_part=1;
insert into test select '{"a" : 42}';
insert into test select '{"a" : [1, 2, 3]}';
select * from test order by toString(json);
create table test (json JSON(a Dynamic)) engine=MergeTree order by tuple() settings min_rows_for_wide_part=10000000, min_bytes_for_wide_part=10000000;
