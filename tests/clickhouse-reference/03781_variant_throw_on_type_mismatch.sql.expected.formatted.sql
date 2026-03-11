SELECT
    v,
    v + 1 AS result
FROM test_variant_compatible
ORDER BY v ASC;

SELECT toTypeName(v + 1)
FROM test_variant_compatible
LIMIT 1;

SELECT
    v,
    v * 2 AS mult,
    v - 1 AS sub
FROM test_variant_compatible
ORDER BY v ASC;

SELECT
    if(number % 2, number, 'even') AS x,
    x + 1
FROM numbers(2);

SELECT arrayRemove([[1, 2], [3, 4]], [['hello']]);

SELECT arrayRemove([[[isNotDistinctFrom(16, isNotDistinctFrom(16, assumeNotNull(isNotNull(materialize(8)))))]], [[materialize(toUInt128(8)), equals(2, isNull(isZeroOrNull(*)))], *], [isNotDistinctFrom(isNull(assumeNotNull(16)), isNotDistinctFrom(isZeroOrNull(NULL), 16)), [], [arrayMap(x -> materialize(0), [NULL])]], [isZeroOrNull(8), [isZeroOrNull(8)]]], [[arrayRemove(['hello', 'world'], concat('a', 1, equals(16, isNullable(8)))), isNotDistinctFrom(16, isNotDistinctFrom(isZeroOrNull(8), 16))]]);

SELECT v + 5
FROM test_variant_incompatible;

SELECT v = 5
FROM test_variant_incompatible;

SELECT arrayRemove([42, v], 100)
FROM test_variant_array;