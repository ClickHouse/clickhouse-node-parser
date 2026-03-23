SYSTEM DROP  TABLE IF EXISTS test_table;

CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = Memory;

SYSTEM DROP  TABLE IF EXISTS test_lookup_table;

CREATE TABLE test_lookup_table
(
    id UInt64,
    lookup_key UInt64
)
ENGINE = Memory;

INSERT INTO test_table;

INSERT INTO test_lookup_table;

INSERT INTO test_lookup_table;

INSERT INTO test_lookup_table;

INSERT INTO test_lookup_table;

INSERT INTO test_lookup_table;

INSERT INTO test_lookup_table;

INSERT INTO test_lookup_table;

INSERT INTO test_lookup_table;

INSERT INTO test_lookup_table;

INSERT INTO test_lookup_table;

SYSTEM DROP  DICTIONARY IF EXISTS test_dictionary;

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

SYSTEM DROP  DICTIONARY test_dictionary;

SYSTEM DROP  TABLE test_table;

SYSTEM DROP  TABLE test_lookup_table;