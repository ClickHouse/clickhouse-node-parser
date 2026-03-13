SELECT arrayJoin([1, 2, 3]);

SELECT '--';

SELECT
    arrayJoin([1, 2, 3]) AS a,
    arrayJoin([1, 2, 3]);

SELECT
    arrayJoin([1, 2, 3]) AS a,
    a;

SELECT
    arrayJoin([[1, 2, 3]]) AS a,
    arrayJoin(a) AS b;

SELECT
    arrayJoin([1, 2, 3]) AS a,
    arrayJoin([1, 2, 3, 4]) AS b;

SELECT arrayMap(x -> arrayJoin([1, 2, 3]), [1, 2, 3]);

SELECT arrayMap(x -> arrayJoin(x), [[1, 2, 3]]); -- { serverError BAD_ARGUMENTS }

SELECT arrayMap(x -> arrayJoin(cast(x, 'Array(UInt8)')), [[1, 2, 3]]); -- { serverError BAD_ARGUMENTS }

SELECT
    arrayMap(x -> x + a, [1, 2, 3]),
    arrayJoin([1,2,3]) AS a;

SELECT
    id,
    arrayJoin(value_1)
FROM test_table;

SELECT
    id,
    arrayJoin(value_1) AS a,
    a
FROM test_table;