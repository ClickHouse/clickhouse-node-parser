SELECT tup
FROM nullable_tuple_sparse
WHERE isNull(tup)
    AND tup.s = 'a';

SELECT sum(NOT isNull(tup))
FROM nullable_tuple_sparse_2;

SELECT sum(isNull(tup))
FROM nullable_tuple_sparse_2;

SELECT
    sum(toUInt64(isNull(tup.s))) AS null_s,
    sum(toUInt64(isNull(tup.u))) AS null_u
FROM nullable_tuple_sparse_2;

SELECT count()
FROM nullable_tuple_sparse_2
WHERE isNull(tup)
    AND isNull(tup.s);

SELECT count()
FROM nullable_tuple_sparse_2
WHERE tup.s = '10';

SELECT sum(tup.u)
FROM nullable_tuple_sparse_2
WHERE NOT isNull(tup);

SELECT
    tup.u,
    tup.s
FROM nullable_tuple_sparse_2
WHERE tup.u IN (0, 5, 10)
ORDER BY tup.u ASC;

SELECT DISTINCT dumpColumnStructure(*)
FROM test_structure;

SELECT DISTINCT dumpColumnStructure(*)
FROM test_structure_2;