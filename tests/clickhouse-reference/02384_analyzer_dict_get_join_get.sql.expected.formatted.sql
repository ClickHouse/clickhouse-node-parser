SET enable_analyzer = 1;

CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

INSERT INTO test_table;

CREATE DICTIONARY test_dictionary
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE 'test_table'))
LIFETIME(0)
LAYOUT(FLAT());

SELECT *
FROM test_dictionary;

SELECT dictGet('test_dictionary', 'value', toUInt64(0));

SELECT dictGet(test_dictionary, 'value', toUInt64(0));

CREATE TABLE test_table_join
(
    id UInt64,
    value String
)
ENGINE = Join(`Any`, `Left`, id);

INSERT INTO test_table_join;

SELECT *
FROM test_table_join;

SELECT joinGet('test_table_join', 'value', toUInt64(0));

SELECT joinGet(test_table_join, 'value', toUInt64(0));