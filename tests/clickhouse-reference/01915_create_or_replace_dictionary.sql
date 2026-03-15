CREATE DATABASE test_01915_db ENGINE=Atomic;
CREATE TABLE test_01915_db.test_source_table_1
(
    id UInt64,
    value String
) ENGINE=TinyLog;
CREATE OR REPLACE DICTIONARY test_01915_db.test_dictionary
(
    id UInt64,
    value String
)
PRIMARY KEY id
LAYOUT(DIRECT())
SOURCE(CLICKHOUSE(DB 'test_01915_db' TABLE 'test_source_table_1'));
SELECT * FROM test_01915_db.test_dictionary;
CREATE TABLE test_01915_db.test_source_table_2
(
    id UInt64,
    value_1 String
) ENGINE=TinyLog;
CREATE OR REPLACE DICTIONARY test_01915_db.test_dictionary
(
    id UInt64,
    value_1 String
)
PRIMARY KEY id
LAYOUT(HASHED())
SOURCE(CLICKHOUSE(DB 'test_01915_db' TABLE 'test_source_table_2'))
LIFETIME(0);
