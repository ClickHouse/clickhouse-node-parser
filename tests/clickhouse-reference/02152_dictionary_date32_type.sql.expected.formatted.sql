CREATE TABLE test_table
(
    id UInt64,
    value Date32
)
ENGINE = TinyLog;

CREATE DICTIONARY test_dictionary
(
    id UInt64,
    value Date32
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE 'test_table'))
LAYOUT(DIRECT());

SELECT *
FROM test_dictionary;

SELECT dictGet('test_dictionary', 'value', toUInt64(0));