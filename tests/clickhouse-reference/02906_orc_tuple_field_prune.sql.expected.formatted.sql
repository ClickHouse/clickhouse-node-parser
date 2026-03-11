SELECT
    int64_column,
    string_column,
    float64_column
FROM file(concat(currentDatabase(), '_02906.orc'))
WHERE int64_column % 15 = 0;

SELECT tuple_column
FROM file(concat(currentDatabase(), '_02906.orc'), 'ORC', 'int64_column Int64, tuple_column Tuple(a Nullable(String), b Nullable(Float64), c Nullable(Int64))')
WHERE int64_column % 15 = 0;

SELECT tuple_column
FROM file(concat(currentDatabase(), '_02906.orc'), 'ORC', 'int64_column Int64, tuple_column Tuple(c Nullable(Int64))')
WHERE int64_column % 15 = 0;

SELECT tuple_column
FROM file(concat(currentDatabase(), '_02906.orc'), 'ORC', 'int64_column Int64, tuple_column Tuple(c Nullable(Int64), d Nullable(String))')
WHERE int64_column % 15 = 0;

SELECT tuple_column
FROM file(concat(currentDatabase(), '_02906.orc'), 'ORC', 'int64_column Int64, tuple_column Tuple(Nullable(String), Nullable(Float64), Nullable(Int64))')
WHERE int64_column % 15 = 0;

SELECT tuple_column
FROM file(concat(currentDatabase(), '_02906.orc'), 'ORC', 'int64_column Int64, tuple_column Tuple(Nullable(String), Nullable(Float64))')
WHERE int64_column % 15 = 0;

SELECT array_tuple_column
FROM file(concat(currentDatabase(), '_02906.orc'), 'ORC', 'int64_column Int64, array_tuple_column Array(Tuple(a Nullable(String), b Nullable(Float64), c Nullable(Int64)))')
WHERE int64_column % 15 = 0;

SELECT array_tuple_column
FROM file(concat(currentDatabase(), '_02906.orc'), 'ORC', 'int64_column Int64, array_tuple_column Array(Tuple(b Nullable(Float64), c Nullable(Int64)))')
WHERE int64_column % 15 = 0;

SELECT array_tuple_column
FROM file(concat(currentDatabase(), '_02906.orc'), 'ORC', 'int64_column Int64, array_tuple_column Array(Tuple(b Nullable(Float64), c Nullable(Int64), d Nullable(String)))')
WHERE int64_column % 15 = 0;

SELECT map_tuple_column
FROM file(concat(currentDatabase(), '_02906.orc'), 'ORC', 'int64_column Int64, map_tuple_column Map(String, Tuple(a Nullable(String), b Nullable(Float64), c Nullable(Int64)))')
WHERE int64_column % 15 = 0;

SELECT map_tuple_column
FROM file(concat(currentDatabase(), '_02906.orc'), 'ORC', 'int64_column Int64, map_tuple_column Map(String, Tuple(b Nullable(Float64), c Nullable(Int64)))')
WHERE int64_column % 15 = 0;

SELECT map_tuple_column
FROM file(concat(currentDatabase(), '_02906.orc'), 'ORC', 'int64_column Int64, map_tuple_column Map(String, Tuple(b Nullable(Float64), c Nullable(Int64), d Nullable(String)))')
WHERE int64_column % 15 = 0;