SET flatten_nested = 0;
DROP TABLE IF EXISTS nested_table;
CREATE TABLE nested_table (id UInt64, first Nested(a Int8, b String)) ENGINE = MergeTree() ORDER BY id;
SET flatten_nested = 1;
DROP TABLE nested_table;
