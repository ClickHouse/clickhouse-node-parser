SELECT arraySymmetricDifference(); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT arraySymmetricDifference(1); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT arraySymmetricDifference(1, 2); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT arraySymmetricDifference(1, [1, 2]); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT arraySymmetricDifference([1, 2], 1); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT arraySort(arraySymmetricDifference([]));

SELECT arraySort(arraySymmetricDifference([1, 2]));

SELECT arraySort(arraySymmetricDifference([1, 2], [1, 3]));

SELECT arraySort(arraySymmetricDifference(['a', 'b'], ['a', 'c']));

SELECT arraySort(arraySymmetricDifference([1, NULL], [1, 3]));

SELECT arraySort(arraySymmetricDifference([1, NULL], [NULL, 3]));

SELECT arraySort(arraySymmetricDifference([1, 1], [1, 1]));

SELECT arraySort(arraySymmetricDifference([1, 2], [1, 2]));

SELECT arraySort(arraySymmetricDifference([1, 2], [1, 2], [1, 2]));

SELECT arraySort(arraySymmetricDifference([1, 2], [1, 2], [1, 3]));

SELECT toTypeName(arraySymmetricDifference([(1, ['a', 'b']), (Null, ['c'])], [(2, ['c', Null]), (1, ['a', 'b'])]));

CREATE TABLE test_arraySymmetricDifference
(
    id Int8,
    arr1 Array(String),
    arr2 Array(String)
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO test_arraySymmetricDifference;

SELECT
    ta.id AS id,
    arraySort(arraySymmetricDifference(ta.arr1, ta.arr2)) AS symmetricDifference
FROM test_arraySymmetricDifference AS ta;