CREATE DATABASE 01913_db ENGINE=Atomic;
CREATE TABLE 01913_db.test_source_table_1
(
    id UInt64,
    value String
) ENGINE=TinyLog;
INSERT INTO 01913_db.test_source_table_1 VALUES (0, 'Value0');
CREATE DICTIONARY 01913_db.test_dictionary
(
    id UInt64,
    value String
)
PRIMARY KEY id
LAYOUT(DIRECT())
SOURCE(CLICKHOUSE(DB '01913_db' TABLE 'test_source_table_1'));
SELECT * FROM 01913_db.test_dictionary;
CREATE TABLE 01913_db.test_source_table_2
(
    id UInt64,
    value_1 String
) ENGINE=TinyLog;
INSERT INTO 01913_db.test_source_table_2 VALUES (0, 'Value1');
