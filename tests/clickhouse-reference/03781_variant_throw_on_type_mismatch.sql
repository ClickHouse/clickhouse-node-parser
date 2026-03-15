SET enable_variant_type = 1;
SET allow_suspicious_variant_types = 1;
SET allow_suspicious_types_in_order_by = 1;
CREATE TABLE test_variant_compatible (v Variant(UInt64, Float64)) ENGINE = Memory;
SELECT v, v + 1 AS result FROM test_variant_compatible ORDER BY v;
SELECT toTypeName(v + 1) FROM test_variant_compatible LIMIT 1;
SELECT v, v * 2 AS mult, v - 1 AS sub FROM test_variant_compatible ORDER BY v;
SELECT number % 2 ? number : 'even' AS x, x + 1 FROM numbers(2); -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT arrayRemove([[1, 2], [3, 4]], [['hello']]); -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT arrayRemove([[[isNotDistinctFrom(16, isNotDistinctFrom(16, assumeNotNull(isNotNull(materialize(8)))))]], [[materialize(toUInt128(8)), equals(2, isNull(isZeroOrNull(*)))], *], [isNotDistinctFrom(isNull(assumeNotNull(16)), isNotDistinctFrom(isZeroOrNull(NULL), 16)), [], [arrayMap(x -> materialize(0), [NULL])]], [isZeroOrNull(8), [isZeroOrNull(8)]]], [[arrayRemove(['hello', 'world'], concat('a', 1, equals(16, isNullable(8)))), isNotDistinctFrom(16, isNotDistinctFrom(isZeroOrNull(8), 16))]]); -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
CREATE TABLE test_variant_incompatible (v Variant(UInt64, String)) ENGINE = Memory;
SELECT v + 5 FROM test_variant_incompatible; -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
SELECT v = 5 FROM test_variant_incompatible; -- {serverError NO_COMMON_TYPE}
CREATE TABLE test_variant_array (v Variant(UInt64, Array(String))) ENGINE = Memory;
SELECT arrayRemove([42, v], 100) FROM test_variant_array; -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}
