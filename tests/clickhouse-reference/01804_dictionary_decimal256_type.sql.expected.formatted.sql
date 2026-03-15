CREATE TABLE dictionary_decimal_source_table
(
    id UInt64,
    decimal_value Decimal256(5)
)
ENGINE = TinyLog;

CREATE DICTIONARY flat_dictionary
(
    id UInt64,
    decimal_value Decimal256(5)
)
PRIMARY KEY id
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() TABLE 'dictionary_decimal_source_table'))
LIFETIME(MIN 1 MAX 1000)
LAYOUT(FLAT());

SELECT dictGet('flat_dictionary', 'decimal_value', toUInt64(1));

CREATE DICTIONARY hashed_dictionary
(
    id UInt64,
    decimal_value Decimal256(5)
)
PRIMARY KEY id
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() TABLE 'dictionary_decimal_source_table'))
LIFETIME(MIN 1 MAX 1000)
LAYOUT(HASHED());

SELECT dictGet('hashed_dictionary', 'decimal_value', toUInt64(1));

CREATE DICTIONARY cache_dictionary
(
    id UInt64,
    decimal_value Decimal256(5)
)
PRIMARY KEY id
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() TABLE 'dictionary_decimal_source_table'))
LIFETIME(MIN 1 MAX 1000)
LAYOUT(CACHE(SIZE_IN_CELLS 10));

SELECT dictGet('cache_dictionary', 'decimal_value', toUInt64(1));

CREATE DICTIONARY direct_dictionary
(
    id UInt64,
    decimal_value Decimal256(5)
)
PRIMARY KEY id
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() TABLE 'dictionary_decimal_source_table'))
LAYOUT(DIRECT());

SELECT dictGet('direct_dictionary', 'decimal_value', toUInt64(1));

CREATE TABLE ip_trie_dictionary_decimal_source_table
(
    prefix String,
    decimal_value Decimal256(5)
)
ENGINE = TinyLog;

CREATE DICTIONARY ip_trie_dictionary
(
    prefix String,
    decimal_value Decimal256(5)
)
PRIMARY KEY prefix
SOURCE(clickhouse(HOST 'localhost' port tcpPort() TABLE 'ip_trie_dictionary_decimal_source_table'))
LIFETIME(MIN 10 MAX 1000)
LAYOUT(IP_TRIE());

SELECT dictGet('ip_trie_dictionary', 'decimal_value', tuple(IPv4StringToNum('127.0.0.0')));

CREATE TABLE dictionary_decimal_polygons_source_table
(
    key Array(Array(Array(Tuple(Float64, Float64)))),
    decimal_value Decimal256(5)
)
ENGINE = TinyLog;

CREATE DICTIONARY polygon_dictionary
(
    key Array(Array(Array(Tuple(Float64, Float64)))),
    decimal_value Decimal256(5)
)
PRIMARY KEY key
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() TABLE 'dictionary_decimal_polygons_source_table'))
LIFETIME(MIN 0 MAX 1000)
LAYOUT(POLYGON());

SELECT dictGet('polygon_dictionary', 'decimal_value', tuple(0.5, 0.5));