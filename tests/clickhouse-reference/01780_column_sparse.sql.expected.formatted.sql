SELECT
    column,
    serialization_kind
FROM `system`.parts_columns
WHERE table = 't_sparse'
    AND database = currentDatabase()
ORDER BY column ASC;

SELECT *
FROM t_sparse
WHERE u != 0
ORDER BY id ASC;

SELECT *
FROM t_sparse
WHERE s != ''
ORDER BY id ASC;

SELECT *
FROM t_sparse
WHERE arr1 != []
ORDER BY id ASC;

SELECT *
FROM t_sparse
WHERE arr2 != []
ORDER BY id ASC;

SELECT sum(u)
FROM t_sparse;

SELECT
    id % 7,
    sum(u)
FROM t_sparse
GROUP BY id % 7
ORDER BY id % 7 ASC;

SELECT arrayFilter(x -> x % 2 = 1, arr2)
FROM t_sparse
WHERE arr2 != []
LIMIT 5;

SELECT *
FROM t_sparse_1
ORDER BY
    v ASC,
    id ASC;

SELECT *
FROM t_sparse_1
ORDER BY
    v DESC,
    id ASC;

SELECT *
FROM t_sparse_1
ORDER BY
    v ASC,
    id ASC
LIMIT 5;

SELECT *
FROM t_sparse_1
ORDER BY
    v DESC,
    id ASC
LIMIT 5;