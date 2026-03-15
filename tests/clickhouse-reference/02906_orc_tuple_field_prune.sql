-- Tags: no-fasttest

set engine_file_truncate_on_insert = 1;
set flatten_nested = 0;
-- { echoOn }
-- Test primitive types
select int64_column, string_column, float64_column from file(currentDatabase() || '_02906.orc') where int64_column % 15 = 0;
-- Test tuple type with names
select tuple_column from file(currentDatabase() || '_02906.orc', 'ORC', 'int64_column Int64, tuple_column Tuple(a Nullable(String), b Nullable(Float64), c Nullable(Int64))') where int64_column % 15 = 0;
select tuple_column from file(currentDatabase() || '_02906.orc', 'ORC', 'int64_column Int64, tuple_column Tuple(c Nullable(Int64))') where int64_column % 15 = 0;
select tuple_column from file(currentDatabase() || '_02906.orc', 'ORC', 'int64_column Int64, tuple_column Tuple(c Nullable(Int64), d Nullable(String))') where int64_column % 15 = 0;
-- Test tuple type without names
select tuple_column from file(currentDatabase() || '_02906.orc', 'ORC', 'int64_column Int64, tuple_column Tuple(Nullable(String), Nullable(Float64), Nullable(Int64))') where int64_column % 15 = 0;
select tuple_column from file(currentDatabase() || '_02906.orc', 'ORC', 'int64_column Int64, tuple_column Tuple(Nullable(String), Nullable(Float64))') where int64_column % 15 = 0;
-- Test tuple nested in array
select array_tuple_column from file(currentDatabase() || '_02906.orc', 'ORC', 'int64_column Int64, array_tuple_column Array(Tuple(a Nullable(String), b Nullable(Float64), c Nullable(Int64)))') where int64_column % 15 = 0;
select array_tuple_column from file(currentDatabase() || '_02906.orc', 'ORC', 'int64_column Int64, array_tuple_column Array(Tuple(b Nullable(Float64), c Nullable(Int64)))') where int64_column % 15 = 0;
select array_tuple_column from file(currentDatabase() || '_02906.orc', 'ORC', 'int64_column Int64, array_tuple_column Array(Tuple(b Nullable(Float64), c Nullable(Int64), d Nullable(String)))') where int64_column % 15 = 0;
-- Test tuple nested in map
select map_tuple_column from file(currentDatabase() || '_02906.orc', 'ORC', 'int64_column Int64, map_tuple_column Map(String, Tuple(a Nullable(String), b Nullable(Float64), c Nullable(Int64)))') where int64_column % 15 = 0;
select map_tuple_column from file(currentDatabase() || '_02906.orc', 'ORC', 'int64_column Int64, map_tuple_column Map(String, Tuple(b Nullable(Float64), c Nullable(Int64)))') where int64_column % 15 = 0;
select map_tuple_column from file(currentDatabase() || '_02906.orc', 'ORC', 'int64_column Int64, map_tuple_column Map(String, Tuple(b Nullable(Float64), c Nullable(Int64), d Nullable(String)))') where int64_column % 15 = 0;
