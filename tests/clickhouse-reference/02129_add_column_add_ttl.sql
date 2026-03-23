create table ttl_test_02129(a Int64, b String, d Date)
Engine=MergeTree partition by d order by a
settings min_bytes_for_wide_part = 0, min_rows_for_wide_part = 0, materialize_ttl_recalculate_only = 0;
insert into ttl_test_02129 select number, '', '2021-01-01' from numbers(10);
insert into ttl_test_02129 select number, '', '2021-01-01', 1 from numbers(10);
select * from ttl_test_02129 order by a, b, d, c;
create table ttl_test_02129(a Int64, b String, d Date)
Engine=MergeTree partition by d order by a
settings min_bytes_for_wide_part = 0, min_rows_for_wide_part = 0, materialize_ttl_recalculate_only = 1;
