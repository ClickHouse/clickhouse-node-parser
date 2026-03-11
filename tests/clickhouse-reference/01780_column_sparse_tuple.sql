SELECT column, subcolumns.names, subcolumns.types, subcolumns.serializations
FROM system.parts_columns
WHERE table = 'sparse_tuple' AND database = currentDatabase()
ORDER BY column;
SELECT t FROM sparse_tuple ORDER BY id LIMIT 5;
SELECT t FROM sparse_tuple WHERE t.a != 0 ORDER BY id LIMIT 5;
SELECT t FROM sparse_tuple WHERE t.a != 0 ORDER BY t.a LIMIT 5;
SELECT t.a FROM sparse_tuple ORDER BY id LIMIT 5;
SELECT t.a FROM sparse_tuple WHERE t.a != 0 ORDER BY id LIMIT 5;
SELECT t.a FROM sparse_tuple WHERE t.a != 0 ORDER BY t.a LIMIT 5;
SELECT t.s FROM sparse_tuple ORDER BY id LIMIT 5;
SELECT t.s FROM sparse_tuple WHERE t.a != 0 ORDER BY id LIMIT 5;
SELECT t.a FROM sparse_tuple WHERE t.b.u != 0 ORDER BY id LIMIT 5;
SELECT t.b.s FROM sparse_tuple ORDER BY id LIMIT 5;
SELECT t.b.s FROM sparse_tuple WHERE t.b.u != 0 ORDER BY id LIMIT 5;
