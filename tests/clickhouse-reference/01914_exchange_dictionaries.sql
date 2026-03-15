CREATE DATABASE 01914_db ENGINE=Atomic;
CREATE TABLE 01914_db.table_1 (id UInt64, value String) ENGINE=TinyLog;
CREATE TABLE 01914_db.table_2 (id UInt64, value String) ENGINE=TinyLog;
CREATE DICTIONARY 01914_db.dictionary_1 (id UInt64, value String)
PRIMARY KEY id
LAYOUT(DIRECT())
SOURCE(CLICKHOUSE(DB '01914_db' TABLE 'table_1'));
CREATE DICTIONARY 01914_db.dictionary_2 (id UInt64, value String)
PRIMARY KEY id
LAYOUT(DIRECT())
SOURCE(CLICKHOUSE(DB '01914_db' TABLE 'table_2'));
SELECT * FROM 01914_db.dictionary_1;
SELECT * FROM 01914_db.dictionary_2;
