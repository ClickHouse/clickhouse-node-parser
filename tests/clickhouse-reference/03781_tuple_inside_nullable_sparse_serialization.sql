SELECT tup FROM nullable_tuple_sparse
WHERE tup IS NULL AND tup.s = 'a';
SELECT sum(not isNull(tup)) FROM nullable_tuple_sparse_2;
SELECT sum(isNull(tup)) FROM nullable_tuple_sparse_2;
SELECT
    sum(toUInt64(isNull(tup.s))) AS null_s,
    sum(toUInt64(isNull(tup.u))) AS null_u
FROM nullable_tuple_sparse_2;
SELECT count() FROM nullable_tuple_sparse_2 WHERE tup IS NULL AND tup.s IS NULL;
SELECT count() FROM nullable_tuple_sparse_2 WHERE tup.s = '10';
SELECT sum(tup.u) FROM nullable_tuple_sparse_2 WHERE NOT isNull(tup);
SELECT tup.u, tup.s
FROM nullable_tuple_sparse_2
WHERE tup.u IN (0, 5, 10)
ORDER BY tup.u;
SELECT DISTINCT dumpColumnStructure(*) FROM test_structure;
SELECT DISTINCT dumpColumnStructure(*) FROM test_structure_2;
