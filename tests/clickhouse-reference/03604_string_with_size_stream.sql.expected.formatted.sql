-- Old string type also supports .size subcolumn
SELECT s.size
FROM test;

-- system.parts_columns table only lists physical subcolumns/substreams
SELECT
    column,
    substreams,
    subcolumns.names,
    subcolumns.types
FROM `system`.parts_columns
WHERE database = currentDatabase()
    AND table = 'test'
    AND active
ORDER BY column ASC;

SELECT
    s.size,
    s
FROM test_old
WHERE y > 5
ORDER BY y ASC
LIMIT 2;

SELECT
    s,
    s.size
FROM test_old
WHERE y > 5
ORDER BY y ASC
LIMIT 2;

SELECT
    s.size,
    s
FROM test_new
WHERE y > 5
ORDER BY y ASC
LIMIT 2;

SELECT
    s,
    s.size
FROM test_new
WHERE y > 5
ORDER BY y ASC
LIMIT 2;

SELECT
    s,
    s.size,
    t.a,
    t.a.size,
    t.b,
    t.b.size
FROM test_old_compact
ORDER BY `all` ASC
LIMIT 2
OFFSET 3;

SELECT
    s.size,
    s,
    t.a,
    t.a.size,
    t.b,
    t.b.size
FROM test_old_compact
ORDER BY `all` ASC
LIMIT 2
OFFSET 3;

SELECT
    s,
    s.size,
    t.a,
    t.a.size,
    t.b,
    t.b.size
FROM test_old_wide
ORDER BY `all` ASC
LIMIT 2
OFFSET 3;

SELECT
    s.size,
    s,
    t.a,
    t.a.size,
    t.b,
    t.b.size
FROM test_old_wide
ORDER BY `all` ASC
LIMIT 2
OFFSET 3;

SELECT
    s,
    s.size,
    t.a,
    t.a.size,
    t.b,
    t.b.size
FROM test_new_compact
ORDER BY `all` ASC
LIMIT 2
OFFSET 3;

SELECT
    s.size,
    s,
    t.a,
    t.a.size,
    t.b,
    t.b.size
FROM test_new_compact
ORDER BY `all` ASC
LIMIT 2
OFFSET 3;

SELECT
    s,
    s.size,
    t.a,
    t.a.size,
    t.b,
    t.b.size
FROM test_new_wide
ORDER BY `all` ASC
LIMIT 2
OFFSET 3;

SELECT
    s.size,
    s,
    t.a,
    t.a.size,
    t.b,
    t.b.size
FROM test_new_wide
ORDER BY `all` ASC
LIMIT 2
OFFSET 3;

SELECT s != ''
FROM t_column_names;