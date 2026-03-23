create table test (s String) engine MergeTree order by () settings serialization_info_version = 'basic', string_serialization_version = 'single_stream';
insert into test values ('hello world');
-- Old string type also supports .size subcolumn
select s.size from test;
-- system.parts_columns table only lists physical subcolumns/substreams
select column, substreams, subcolumns.names, subcolumns.types from system.parts_columns where database = currentDatabase() and table = 'test' and active order by column;
create table test (s String) engine MergeTree order by () settings serialization_info_version = 'with_types', string_serialization_version = 'with_size_stream';
-- When `serialization_info_version` is set to `single_stream`, any per-type string serialization version (`string_serialization_version`) will be ignored and reset to `DEFAULT`.
create table test (s String) engine MergeTree order by () settings serialization_info_version = 'basic', string_serialization_version = 'with_size_stream';
-- Lazy materialization test

set query_plan_optimize_lazy_materialization=1;
set query_plan_max_limit_for_lazy_materialization=10;
create table test_old (x UInt64, y UInt64, s String) engine MergeTree order by x settings serialization_info_version = 'basic';
create table test_new (x UInt64, y UInt64, s String) engine MergeTree order by x settings serialization_info_version = 'with_types', string_serialization_version = 'with_size_stream';
insert into test_old select number, number, number from numbers(10);
insert into test_new select number, number, number from numbers(10);
select s.size, s from test_old where y > 5 order by y limit 2;
select s, s.size from test_old where y > 5 order by y limit 2;
select s.size, s from test_new where y > 5 order by y limit 2;
select s, s.size from test_new where y > 5 order by y limit 2;
create table test_old_compact (s String, t Tuple(a String, b String)) engine MergeTree order by () settings serialization_info_version = 'basic', min_rows_for_wide_part = 10000000, min_bytes_for_wide_part = 10000000;
create table test_old_wide (s String, t Tuple(a String, b String)) engine MergeTree order by () settings serialization_info_version = 'basic', min_rows_for_wide_part = 1, min_bytes_for_wide_part = 1;
create table test_new_compact (s String, t Tuple(a String, b String)) engine MergeTree order by () settings serialization_info_version = 'with_types', string_serialization_version = 'with_size_stream', min_rows_for_wide_part = 10000000, min_bytes_for_wide_part = 10000000;
create table test_new_wide (s String, t Tuple(a String, b String)) engine MergeTree order by () settings serialization_info_version = 'with_types', string_serialization_version = 'with_size_stream', min_rows_for_wide_part = 1, min_bytes_for_wide_part = 1;
insert into test_old_compact select number, (number, number) from numbers(10);
insert into test_old_wide select number, (number, number) from numbers(10);
insert into test_new_compact select number, (number, number) from numbers(10);
insert into test_new_wide select number, (number, number) from numbers(10);
select s, s.size, t.a, t.a.size, t.b, t.b.size from test_old_compact order by all limit 2 offset 3;
select s.size, s, t.a, t.a.size, t.b, t.b.size from test_old_compact order by all limit 2 offset 3;
select s, s.size, t.a, t.a.size, t.b, t.b.size from test_old_wide order by all limit 2 offset 3;
select s.size, s, t.a, t.a.size, t.b, t.b.size from test_old_wide order by all limit 2 offset 3;
select s, s.size, t.a, t.a.size, t.b, t.b.size from test_new_compact order by all limit 2 offset 3;
select s.size, s, t.a, t.a.size, t.b, t.b.size from test_new_compact order by all limit 2 offset 3;
select s, s.size, t.a, t.a.size, t.b, t.b.size from test_new_wide order by all limit 2 offset 3;
select s.size, s, t.a, t.a.size, t.b, t.b.size from test_new_wide order by all limit 2 offset 3;
-- Test empty string comparison and .size subcolumn optimization
set enable_analyzer = 1;
set optimize_empty_string_comparisons = 1;
set optimize_functions_to_subcolumns = 0;
create table t_column_names (s String) engine Memory;
insert into t_column_names values ('foo');
select s != '' from t_column_names;
set optimize_functions_to_subcolumns = 1;
