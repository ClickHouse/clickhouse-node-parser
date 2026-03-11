SELECT arrayConcat(emptyArrayUInt8());

SELECT arrayConcat(emptyArrayUInt8(), emptyArrayUInt8());

SELECT arrayConcat(emptyArrayUInt8(), emptyArrayUInt8(), emptyArrayUInt8());

SELECT arrayConcat([Null], emptyArrayUInt8(), [1]);

SELECT arrayConcat([1, 2], [-1, -2], [0.3, 0.7], [Null]);

SELECT arrayConcat(NULL, emptyArrayUInt8());

SELECT arrayConcat([1], [-1], NULL);

SELECT arrayConcat([1, 2], [3, 4]);

SELECT arrayConcat([1], [2, 3, 4]);

SELECT arrayConcat(['abc'], ['def', 'gh', 'qwe']);

SELECT arrayConcat([1, NULL, 2], [3, NULL, 4]);

SELECT arrayConcat([1, Null, 2], [3, 4]);

SELECT arraySlice(NULL, 1, 2);

SELECT arraySlice([1, 2, 3, 4, 5, 6], NULL, NULL);

SELECT arraySlice([1, 2, 3, 4, 5, 6], 2, NULL);

SELECT arraySlice([1, 2, 3, 4, 5, 6], NULL, 4);

SELECT arraySlice([1, 2, 3, 4, 5, 6], NULL, -2);

SELECT arraySlice([1, 2, 3, 4, 5, 6], -3, NULL);

SELECT arraySlice([1, 2, 3, 4, 5, 6], 2, 3);

SELECT arraySlice([1, 2, Null, 4, 5, 6], 2, 4);

SELECT arraySlice(['a', 'b', 'c', 'd', 'e'], 2, 3);

SELECT arraySlice([Null, 'b', Null, 'd', 'e'], 2, 3);

SELECT
    arraySlice([], materialize(NULL), NULL),
    1
FROM numbers(2);

SELECT arrayPushBack(NULL, 1);

SELECT arrayPushBack([1], 1);

SELECT arrayPushBack([Null], 1);

SELECT arrayPushBack([0.5, 0.7], 1);

SELECT arrayPushBack([1], -1);

SELECT arrayPushBack(['a', 'b'], 'cd');

SELECT arrayPushBack(emptyArrayUInt8(), 1);

SELECT arrayPushBack(emptyArrayUInt8(), -1);

SELECT arrayPushFront(NULL, 1);

SELECT arrayPushFront([1], 1);

SELECT arrayPushFront([Null], 1);

SELECT arrayPushFront([0.5, 0.7], 1);

SELECT arrayPushFront([1], -1);

SELECT arrayPushFront(['a', 'b'], 'cd');

SELECT arrayPushFront(emptyArrayUInt8(), 1);

SELECT arrayPushFront(emptyArrayUInt8(), -1);

SELECT arrayPopBack(NULL);

SELECT arrayPopBack(emptyArrayUInt8());

SELECT arrayPopBack([1]);

SELECT arrayPopBack([1, 2, 3]);

SELECT arrayPopBack([0.1, 0.2, 0.3]);

SELECT arrayPopBack(['a', 'b', 'c']);

SELECT arrayPopFront(NULL);

SELECT arrayPopFront(emptyArrayUInt8());

SELECT arrayPopFront([1]);

SELECT arrayPopFront([1, 2, 3]);

SELECT arrayPopFront([0.1, 0.2, 0.3]);

SELECT arrayPopFront(['a', 'b', 'c']);

SELECT *
FROM array_functions;

SELECT
    arrayConcat(arr1, arr2),
    arr1,
    arr2
FROM array_functions;

SELECT
    arrayConcat(arr1, arr2, arr1),
    arr1,
    arr2
FROM array_functions;

SELECT
    arr1,
    o,
    l,
    arraySlice(arr1, o, l)
FROM array_functions;

SELECT
    arr1,
    2,
    4,
    arraySlice(arr1, -4, -1)
FROM array_functions;

SELECT
    arr1,
    arrayPushFront(arr1, 1)
FROM array_functions;

SELECT
    arr1,
    arrayPushFront(arr1, 0.1)
FROM array_functions;

SELECT
    arr1,
    arrayPushFront(arr1, l)
FROM array_functions;

SELECT
    arr1,
    arrayPushFront(arr1, nl)
FROM array_functions;

SELECT arrayPushFront([1, 2, 3], l)
FROM array_functions;

SELECT 'arrayPushFront([1, 2, 3], nl)'
FROM array_functions;

SELECT arrayPushFront([1, 2, 3], nl)
FROM array_functions;

SELECT
    arr1,
    arrayPushBack(arr1, 1)
FROM array_functions;

SELECT
    arr1,
    arrayPushBack(arr1, 0.1)
FROM array_functions;

SELECT
    arr1,
    arrayPushBack(arr1, l)
FROM array_functions;

SELECT
    arr1,
    arrayPushBack(arr1, nl)
FROM array_functions;

SELECT arrayPushBack([1, 2, 3], l)
FROM array_functions;

SELECT arrayPushBack([1, 2, 3], nl)
FROM array_functions;

SELECT
    arr1,
    arrayPopFront(arr1)
FROM array_functions;

SELECT
    arr1,
    arrayPopBack(arr1)
FROM array_functions;

SELECT
    arr1,
    arrayPushFront(arr1, '1')
FROM array_functions;

SELECT arrayPushFront(['a', 'b', 'c'], val)
FROM array_functions;

SELECT
    arr1,
    arrayPushBack(arr1, '1')
FROM array_functions;

SELECT arrayPushBack(['a', 'b', 'c'], val)
FROM array_functions;