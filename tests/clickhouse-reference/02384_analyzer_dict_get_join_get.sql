SET enable_analyzer = 1;
CREATE TABLE test_table
(
    id UInt64,
    value String
) ENGINE=TinyLog;
INSERT INTO test_table VALUES (0, 'Value');
CREATE DICTIONARY test_dictionary
(
    id UInt64,
    value String
)
PRIMARY KEY id
LAYOUT(FLAT())
SOURCE(CLICKHOUSE(TABLE 'test_table'))
LIFETIME(0);
SELECT * FROM test_dictionary;
SELECT dictGet('test_dictionary', 'value', toUInt64(0));
SELECT dictGet(test_dictionary, 'value', toUInt64(0));
CREATE TABLE test_table_join
(
    id UInt64,
    value String
) ENGINE=Join(Any, Left, id);
INSERT INTO test_table_join VALUES (0, 'Value');
SELECT * FROM test_table_join;
SELECT joinGet('test_table_join', 'value', toUInt64(0));
SELECT joinGet(test_table_join, 'value', toUInt64(0));
