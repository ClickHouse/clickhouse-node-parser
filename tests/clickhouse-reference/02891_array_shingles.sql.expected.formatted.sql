SELECT '-- negative tests';

SELECT arrayShingles();

SELECT arrayShingles([1, 2, 3, 4, 5]);

SELECT arrayShingles([1, 2, 3, 4, 5], 2, 3);

SELECT arrayShingles([1, 2, 3, 4, 5], 'str');

SELECT arrayShingles((1, 2, 3, 4, 5), 0);

SELECT arrayShingles([1, 2, 3, 4, 5], 0);

SELECT arrayShingles([1, 2, 3, 4, 5], -2);

SELECT arrayShingles([1, 2, 3, 4, 5], 6);

SELECT arrayShingles([], 1);

SELECT
    [1, 2, 3, 4, 5] AS arr,
    1 AS len,
    arrayShingles(arr, len),
    arrayShingles(materialize(arr), len);

SELECT
    [1, 2, 3, 4, 5] AS arr,
    3 AS len,
    arrayShingles(arr, len),
    arrayShingles(materialize(arr), len);

SELECT
    [1, 2 ,3, 4, 5] AS arr,
    5 AS len,
    arrayShingles(arr, len),
    arrayShingles(materialize(arr), len);

SELECT
    ['ab', 'c', 'de', '', 'hi'] AS arr,
    1 AS len,
    arrayShingles(arr, len),
    arrayShingles(materialize(arr), len);

SELECT
    ['ab', 'c', 'de', '', 'hi'] AS arr,
    3 AS len,
    arrayShingles(arr, len),
    arrayShingles(materialize(arr), len);

SELECT
    ['ab', 'c', 'de', '', 'hi'] AS arr,
    5 AS len,
    arrayShingles(arr, len),
    arrayShingles(materialize(arr), len);

SELECT arrayShingles([toNullable(2), toNullable(1)], 1);

SELECT arrayShingles([toLowCardinality(2), toLowCardinality(1)], 1);