-- Tags: no-parallel
SYSTEM DROP  TABLE IF EXISTS dictionary_primary_key_source_table;

CREATE TABLE dictionary_primary_key_source_table
(
    identifier UInt64,
    v UInt64
)
ENGINE = TinyLog;

INSERT INTO dictionary_primary_key_source_table;

SYSTEM DROP  DICTIONARY IF EXISTS flat_dictionary;

CREATE DICTIONARY flat_dictionary
(
    identifier UInt64,
    v UInt64
)
PRIMARY KEY v
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() TABLE 'dictionary_primary_key_source_table'))
LIFETIME(MIN 1 MAX 1000)
LAYOUT(FLAT());

SELECT *
FROM flat_dictionary;

SYSTEM DROP  DICTIONARY flat_dictionary;

SYSTEM DROP  TABLE dictionary_primary_key_source_table;