CREATE TABLE dictionary_primary_key_source_table
(
    identifier UInt64,
    v UInt64
)
ENGINE = TinyLog;

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