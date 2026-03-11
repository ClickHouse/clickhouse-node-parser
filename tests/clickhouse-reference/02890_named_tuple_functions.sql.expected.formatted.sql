SELECT toTypeName(tuple(i, j))
FROM x;

SELECT tupleNames(tuple(i, j))
FROM x;

SELECT toTypeName(tuple(1, j))
FROM x;

SELECT tupleNames(tuple(1, j))
FROM x;

SELECT toTypeName(tuple(1 AS k, j))
FROM x;

SELECT tupleNames(tuple(1 AS k, j))
FROM x;

SELECT toTypeName(tuple(i, i, j, j))
FROM x;

SELECT tupleNames(tuple(i, i, j, j))
FROM x;

SELECT tupleNames(1);

SELECT *
FROM tbl;

SELECT
    toTypeName(tuple(NULL)),
    toTypeName(tuple(true)),
    toTypeName(tuple(false));