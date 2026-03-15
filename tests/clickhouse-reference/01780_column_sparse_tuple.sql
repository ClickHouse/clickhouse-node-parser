CREATE TABLE sparse_tuple (id UInt64, t Tuple(a UInt64, s String))
ENGINE = MergeTree ORDER BY tuple()
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.5, serialization_info_version = 'basic';
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
CREATE TABLE sparse_tuple (id UInt64, t Tuple(a UInt64, b Tuple(u UInt32, s String)))
ENGINE = MergeTree ORDER BY tuple()
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.5, serialization_info_version = 'basic';
SELECT t.a FROM sparse_tuple WHERE t.b.u != 0 ORDER BY id LIMIT 5;
SELECT t.b.s FROM sparse_tuple ORDER BY id LIMIT 5;
SELECT t.b.s FROM sparse_tuple WHERE t.b.u != 0 ORDER BY id LIMIT 5;
