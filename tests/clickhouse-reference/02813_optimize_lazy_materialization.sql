
SELECT * FROM optimize_lazy_materialization ORDER BY c LIMIT 3;
-- queries with _part_offset column in projection
SELECT a, b, c, d, _part_index, _part_offset FROM optimize_lazy_materialization ORDER BY c LIMIT 3;
SELECT _part_index, _part_offset FROM optimize_lazy_materialization ORDER BY c LIMIT 3;
-- queries with filter
SELECT * FROM optimize_lazy_materialization WHERE d > 1 ORDER BY c LIMIT 3;
SELECT * FROM optimize_lazy_materialization PREWHERE d > 1 ORDER BY c LIMIT 3;
-- queries with function in order by
SELECT * FROM optimize_lazy_materialization WHERE d > 1 ORDER BY -c LIMIT 3;
SELECT * FROM optimize_lazy_materialization WHERE d > 1 ORDER BY -toFloat64(c) LIMIT 3;
SELECT * FROM optimize_lazy_materialization WHERE d > 1 ORDER BY c + 1 LIMIT 3;
-- queries with function in filter
SELECT * FROM optimize_lazy_materialization WHERE d % 3 > 1 ORDER BY c LIMIT 3;
-- queries with aliases
SELECT a AS a, b AS b, c AS c, d AS d FROM optimize_lazy_materialization WHERE d > 1 ORDER BY c LIMIT 3;
SELECT a + 1 AS a, b AS b, c + 1 AS c, d + 1 AS d FROM optimize_lazy_materialization WHERE d > 1 ORDER BY c LIMIT 3;
-- queries with non-trivial action's chain in expression
SELECT y, z FROM (SELECT a as y, b as z FROM optimize_lazy_materialization WHERE d > 1 ORDER BY c LIMIT 3) ORDER BY y + 1;

SELECT * FROM optimize_lazy_materialization_with_compact_mt ORDER BY c LIMIT 3;
-- queries with _part_offset column in projection
SELECT a, b, c, d, _part_index, _part_offset FROM optimize_lazy_materialization_with_compact_mt ORDER BY c LIMIT 3;
SELECT _part_index, _part_offset FROM optimize_lazy_materialization_with_compact_mt ORDER BY c LIMIT 3;
-- queries with filter
SELECT * FROM optimize_lazy_materialization_with_compact_mt WHERE d > 1 ORDER BY c LIMIT 3;
SELECT * FROM optimize_lazy_materialization_with_compact_mt PREWHERE d > 1 ORDER BY c LIMIT 3;

SELECT * FROM optimize_lazy_materialization_with_int_data_type ORDER BY b LIMIT 10;

SELECT * FROM optimize_lazy_materialization_with_float_data_type ORDER BY b LIMIT 10;

SELECT * FROM optimize_lazy_materialization_with_decimal_data_type ORDER BY b LIMIT 10;

SELECT * FROM optimize_lazy_materialization_with_string_data_type ORDER BY b LIMIT 10;

SELECT * FROM optimize_lazy_materialization_with_fixed_string_data_type ORDER BY b LIMIT 10;

SELECT * FROM optimize_lazy_materialization_with_date_data_type ORDER BY b LIMIT 10;

SELECT * FROM optimize_lazy_materialization_with_date32_data_type ORDER BY b LIMIT 10;

SELECT a, b, toUInt64(c) FROM optimize_lazy_materialization_with_datetime_data_type ORDER BY b LIMIT 10;

SELECT a, b, toUInt64(c) FROM optimize_lazy_materialization_with_datetime64_data_type ORDER BY b LIMIT 10;

SELECT * FROM optimize_lazy_materialization_with_enum_data_type ORDER BY b LIMIT 10;

SELECT * FROM optimize_lazy_materialization_with_bool_data_type ORDER BY b LIMIT 10;

SELECT a, b, length(toString(c)) FROM optimize_lazy_materialization_with_uuid_data_type ORDER BY b LIMIT 10;

SELECT * FROM optimize_lazy_materialization_with_ipv4_data_type ORDER BY b LIMIT 10;

SELECT * FROM optimize_lazy_materialization_with_ipv6_data_type ORDER BY b LIMIT 10;

SELECT a, b, c, c.size0 FROM optimize_lazy_materialization_with_array_data_type ORDER BY b LIMIT 10;
SELECT a, b, c.field2 FROM optimize_lazy_materialization_with_array_data_type ORDER BY b LIMIT 10;

SELECT * FROM optimize_lazy_materialization_with_tuple_data_type ORDER BY b LIMIT 10;

SELECT * FROM optimize_lazy_materialization_with_map_data_type ORDER BY b LIMIT 10;
SELECT a, b, c['key1'] FROM optimize_lazy_materialization_with_map_data_type ORDER BY b LIMIT 10;

SELECT * FROM optimize_lazy_materialization_with_variant_data_type ORDER BY b LIMIT 10;
-- queries with subcolumn of variant data type
SELECT a, b, c.UInt64 FROM optimize_lazy_materialization_with_variant_data_type ORDER BY b LIMIT 10;
SELECT a, b, c.UInt64.null FROM optimize_lazy_materialization_with_variant_data_type ORDER BY b LIMIT 10;

SELECT * FROM optimize_lazy_materialization_with_low_cardinality_data_type ORDER BY b LIMIT 10;

SELECT * FROM optimize_lazy_materialization_with_nullable_data_type ORDER BY b LIMIT 10;

SELECT a, b, c.id, c.order FROM optimize_lazy_materialization_with_nested_data_type ORDER BY b LIMIT 10;

SELECT a, b, c FROM optimize_lazy_materialization_with_dynamic_data_type ORDER BY b LIMIT 10;
-- queries with subcolumn of dynamic data type
SELECT a, b, c.IPv4, c.String FROM optimize_lazy_materialization_with_dynamic_data_type ORDER BY b LIMIT 10;

SELECT * FROM optimize_lazy_materialization_with_sparse_data_type ORDER BY b LIMIT 10;
