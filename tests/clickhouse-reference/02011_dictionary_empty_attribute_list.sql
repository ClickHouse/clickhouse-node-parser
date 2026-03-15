CREATE TABLE test_table (id UInt64) ENGINE=TinyLog;
CREATE DICTIONARY test_dictionary (id UInt64) PRIMARY KEY id LAYOUT(DIRECT()) SOURCE(CLICKHOUSE(TABLE 'test_table'));
SELECT * FROM test_dictionary;
SELECT dictHas('test_dictionary', toUInt64(0));
SELECT dictHas('test_dictionary', toUInt64(1));
