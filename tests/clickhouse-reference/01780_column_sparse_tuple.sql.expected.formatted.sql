SELECT
    column,
    subcolumns.names,
    subcolumns.types,
    subcolumns.serializations
FROM `system`.parts_columns
WHERE table = 'sparse_tuple'
    AND database = currentDatabase()
ORDER BY column ASC;

SELECT t
FROM sparse_tuple
ORDER BY id ASC
LIMIT 5;

SELECT t
FROM sparse_tuple
WHERE t.a != 0
ORDER BY id ASC
LIMIT 5;

SELECT t
FROM sparse_tuple
WHERE t.a != 0
ORDER BY t.a ASC
LIMIT 5;

SELECT t.a
FROM sparse_tuple
ORDER BY id ASC
LIMIT 5;

SELECT t.a
FROM sparse_tuple
WHERE t.a != 0
ORDER BY id ASC
LIMIT 5;

SELECT t.a
FROM sparse_tuple
WHERE t.a != 0
ORDER BY t.a ASC
LIMIT 5;

SELECT t.s
FROM sparse_tuple
ORDER BY id ASC
LIMIT 5;

SELECT t.s
FROM sparse_tuple
WHERE t.a != 0
ORDER BY id ASC
LIMIT 5;

SELECT t.a
FROM sparse_tuple
WHERE t.b.u != 0
ORDER BY id ASC
LIMIT 5;

SELECT t.b.s
FROM sparse_tuple
ORDER BY id ASC
LIMIT 5;

SELECT t.b.s
FROM sparse_tuple
WHERE t.b.u != 0
ORDER BY id ASC
LIMIT 5;