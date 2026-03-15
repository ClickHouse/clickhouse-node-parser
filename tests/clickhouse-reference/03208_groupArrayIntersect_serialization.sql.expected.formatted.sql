SELECT
    hex(groupArrayIntersectState([1]) AS a),
    toTypeName(a);

SELECT finalizeAggregation(CAST(unhex('010101'), 'AggregateFunction(groupArrayIntersect, Array(UInt8))'));

CREATE TABLE grouparray
(
    v AggregateFunction(groupArrayIntersect, Array(UInt8))
)
ENGINE = Log;

SELECT
    '1',
    arraySort(groupArrayIntersectMerge(v))
FROM grouparray;

SELECT
    '2',
    arraySort(groupArrayIntersectMerge(v))
FROM grouparray;

SELECT
    '3',
    arraySort(groupArrayIntersectMerge(v))
FROM grouparray;

SELECT
    '5',
    arraySort(groupArrayIntersectMerge(v))
FROM grouparray;

SELECT
    '6',
    arraySort(groupArrayIntersectMerge(v))
FROM grouparray;

SELECT
    '7',
    arraySort(groupArrayIntersectMerge(v))
FROM grouparray;

CREATE TABLE grouparray_string
(
    v AggregateFunction(groupArrayIntersect, Array(Tuple(Array(String))))
)
ENGINE = Log;

SELECT
    'a',
    arraySort(groupArrayIntersectMerge(v))
FROM grouparray_string;

SELECT
    'b',
    arraySort(groupArrayIntersectMerge(v))
FROM grouparray_string;

SELECT
    'c',
    arraySort(groupArrayIntersectMerge(v))
FROM grouparray_string;

SELECT
    'd',
    arraySort(groupArrayIntersectMerge(v))
FROM grouparray_string;

SELECT
    'e',
    arraySort(groupArrayIntersectMerge(v))
FROM grouparray_string;