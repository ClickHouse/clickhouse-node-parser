SELECT arrayRemove([], 1);

SELECT arrayRemove([0], 0);

SELECT arrayRemove([1], 1);

SELECT arrayRemove([2], 2);

SELECT arrayRemove([1,1], 1);

SELECT arrayRemove([1,2], 1);

SELECT arrayRemove([1,1,2], 1);

SELECT arrayRemove([1,2,1], 1);

SELECT arrayRemove([2,1,1], 1);

SELECT arrayRemove([1,2,2,3,3,3,4,4,4,4,5,5,5,5,5], 2);

SELECT arrayRemove([1,2,2,3,3,3,4,4,4,4,5,5,5,5,5], 3);

SELECT arrayRemove([1,2,2,3,3,3,4,4,4,4,5,5,5,5,5], 6);

SELECT arrayRemove([1,2,3,2], 2 * 1);

SELECT arrayRemove([NULL], NULL);

SELECT arrayRemove([1, NULL, 2], NULL);

SELECT arrayRemove([NULL, NULL, 1], NULL);

SELECT arrayRemove([1, NULL, 2], 1);

SELECT arrayRemove([1, NULL, 2], 2);

SELECT arrayRemove([1, NULL, 2], 3);

SELECT arrayRemove([1, 1, NULL, NULL, nan, nan, 2, 2, 2], NULL);

SELECT arrayRemove([1, 1, NULL, NULL, nan, nan, 2, 2, 2], nan);

SELECT arrayRemove([1, 1, NULL, NULL, nan, nan, 2, 2, 2], 2);

SELECT arrayRemove(arrayMap(x -> 0, [NULL]), 0);

SELECT toString(arrayRemove(arrayMap(x -> 0, [NULL]), 0));

SELECT arrayRemove(['a','b','a'], 'a');

SELECT arrayRemove(['hello', 'world'], concat('wor', 'ld'));

SELECT arrayRemove(['foo', 'bar', 'foo'], concat(repeat('f', 1), 'oo'));

SELECT arrayRemove([[[]], [[], []], [[], []], [[]]], [[]]);

SELECT arrayRemove([[1], [1,2], [2,3], [1,2]], [1,2]);

SELECT arrayRemove([[1], [1,2], [2,3], [1,2]], [3]);

SELECT arrayRemove(`array`, element)
FROM test;

SELECT arrayRemove([(1,2), (3,4)], (1,2));

SELECT arrayRemove([1,2,3]);

SELECT arrayRemove([1,2,3], 2, 3);

SELECT arrayRemove(1, 1);

SELECT arrayRemove([1,2,3], [1]);

SELECT arrayRemove([1,2,3], '1');

SELECT arrayRemove(['a', 'b', 'c'], 1);

SELECT arrayRemove(CAST(['a', NULL, 'b'] AS Array(LowCardinality(Nullable(String)))), 'a');

SELECT arrayRemove(CAST(['a', NULL, 'b'] AS Array(LowCardinality(Nullable(String)))), NULL);

SELECT arrayRemove([CAST(1 AS Dynamic), CAST(NULL AS Dynamic), CAST(2 AS Dynamic)], 1);

SELECT arrayRemove([CAST(1 AS Dynamic), CAST(NULL AS Dynamic), CAST(2 AS Dynamic)], NULL);

SELECT arrayRemove([
        1::Variant(UInt8, String),
        'x'::Variant(UInt8, String),
        NULL::Variant(UInt8, String)
    ], 'x'::Variant(UInt8, String));

SELECT arrayRemove([
        1::Variant(UInt8, String),
        'x'::Variant(UInt8, String),
        NULL::Variant(UInt8, String)
    ], NULL);

SELECT arrayRemove(arr, 3)
FROM arr_test;

SELECT arrayRemove(arr, elem)
FROM elem_test;

SELECT arrayRemove(arr, 2)
FROM nullable_arr;

SELECT arrayRemove(arr, NULL)
FROM nullable_arr;

SELECT arrayRemove(arr, elem)
FROM (
        SELECT
            [1,2,3] AS arr,
            number AS elem
        FROM numbers(3)
    );