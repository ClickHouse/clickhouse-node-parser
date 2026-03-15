CREATE TABLE test_table
(
    id UInt64
)
ENGINE = TinyLog;

CREATE DICTIONARY test_dictionary
(
    id UInt64
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE 'test_table'))
LAYOUT(DIRECT());

SELECT *
FROM test_dictionary;

SELECT dictHas('test_dictionary', toUInt64(0));

SELECT dictHas('test_dictionary', toUInt64(1));