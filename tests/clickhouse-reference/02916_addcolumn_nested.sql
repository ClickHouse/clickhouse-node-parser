SET flatten_nested = 0;
CREATE TABLE nested_table (id UInt64, first Nested(a Int8, b String)) ENGINE = MergeTree() ORDER BY id;
SET flatten_nested = 1;
