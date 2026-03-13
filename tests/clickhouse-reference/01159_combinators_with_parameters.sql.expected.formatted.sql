SELECT toTypeName(topKArrayState(10)([toString(number)]))
FROM numbers(100);

SELECT toTypeName(topKDistinctState(10)(toString(number)))
FROM numbers(100);

SELECT toTypeName(topKForEachState(10)([toString(number)]))
FROM numbers(100);

SELECT toTypeName(topKIfState(10)(toString(number), number % 2))
FROM numbers(100);

SELECT toTypeName(topKMergeState(10)(state))
FROM (
        SELECT topKState(10)(toString(number)) AS state
        FROM numbers(100)
    );

SELECT toTypeName(topKOrNullState(10)(toString(number)))
FROM numbers(100); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT toTypeName(topKOrDefaultState(10)(toString(number)))
FROM numbers(100);

SELECT toTypeName(topKResampleState(10, 1, 2, 42)(toString(number), number))
FROM numbers(100);

SELECT toTypeName(topKState(10)(toString(number)))
FROM numbers(100);

SELECT toTypeName(topKArrayResampleOrDefaultIfState(10, 1, 2, 42)([toString(number)], number, number % 2))
FROM numbers(100);

SELECT round(quantileArrayMerge(0.10)(tuple(*).1))
FROM t0;

SELECT round(quantileDistinctMerge(0.10)(tuple(*).1))
FROM t1;

SELECT arrayMap(x -> round(x), quantileForEachMerge(0.10)(tuple(*).1))
FROM t2;

SELECT round(quantileIfMerge(0.10)(tuple(*).1))
FROM t3;

SELECT round(quantileMerge(0.10)(tuple(*).1))
FROM t4;

SELECT round(quantileOrNullMerge(0.10)(tuple(*).1))
FROM t5;

SELECT round(quantileOrDefaultMerge(0.10)(tuple(*).1))
FROM t6;

SELECT arrayMap(x -> round(x), quantileResampleMerge(0.10, 1, 2, 42)(tuple(*).1))
FROM t7;

SELECT round(quantileMerge(0.10)(tuple(*).1))
FROM t8;

SELECT arrayMap(x -> round(x), quantileArrayResampleOrDefaultIfMerge(0.10, 1, 2, 42)(tuple(*).1))
FROM t9;