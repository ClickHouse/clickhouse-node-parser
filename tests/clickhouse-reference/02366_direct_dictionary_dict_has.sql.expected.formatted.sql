CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = Memory;

CREATE TABLE test_lookup_table
(
    id UInt64,
    lookup_key UInt64
)
ENGINE = Memory;

CREATE DICTIONARY test_dictionary
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE 'test_table'))
LAYOUT(DIRECT());

SELECT
    id,
    lookup_key,
    dictHas('test_dictionary', lookup_key)
FROM test_lookup_table
ORDER BY id ASC;