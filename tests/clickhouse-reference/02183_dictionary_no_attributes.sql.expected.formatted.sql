CREATE TABLE `02183_dictionary_test_table`
(
    id UInt64
)
ENGINE = TinyLog;

SELECT *
FROM `02183_dictionary_test_table`;

CREATE DICTIONARY `02183_flat_dictionary`
(
    id UInt64
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE '02183_dictionary_test_table'))
LIFETIME(0)
LAYOUT(FLAT());

SELECT dictGet('02183_flat_dictionary', 'value', 0); -- {serverError BAD_ARGUMENTS}

SELECT dictHas('02183_flat_dictionary', 0);

SELECT dictHas('02183_flat_dictionary', 1);

SELECT dictHas('02183_flat_dictionary', 2);

SELECT *
FROM `02183_flat_dictionary`;

CREATE DICTIONARY `02183_hashed_dictionary`
(
    id UInt64
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE '02183_dictionary_test_table'))
LIFETIME(0)
LAYOUT(HASHED());

SELECT dictHas('02183_hashed_dictionary', 0);

SELECT dictHas('02183_hashed_dictionary', 1);

SELECT dictHas('02183_hashed_dictionary', 2);

SELECT *
FROM `02183_hashed_dictionary`;

CREATE DICTIONARY `02183_hashed_array_dictionary`
(
    id UInt64
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE '02183_dictionary_test_table'))
LIFETIME(0)
LAYOUT(HASHED_ARRAY());

SELECT dictHas('02183_hashed_array_dictionary', 0);

SELECT dictHas('02183_hashed_array_dictionary', 1);

SELECT dictHas('02183_hashed_array_dictionary', 2);

SELECT *
FROM `02183_hashed_array_dictionary`;

CREATE DICTIONARY `02183_cache_dictionary`
(
    id UInt64
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE '02183_dictionary_test_table'))
LIFETIME(0)
LAYOUT(CACHE(SIZE_IN_CELLS 10));

SELECT dictHas('02183_cache_dictionary', 0);

SELECT dictHas('02183_cache_dictionary', 1);

SELECT dictHas('02183_cache_dictionary', 2);

SELECT *
FROM `02183_cache_dictionary`;

CREATE DICTIONARY `02183_direct_dictionary`
(
    id UInt64
)
PRIMARY KEY id
SOURCE(clickhouse(TABLE '02183_dictionary_test_table'))
LIFETIME(0)
LAYOUT(HASHED());

SELECT dictHas('02183_direct_dictionary', 0);

SELECT dictHas('02183_direct_dictionary', 1);

SELECT dictHas('02183_direct_dictionary', 2);

SELECT *
FROM `02183_direct_dictionary`;

CREATE TABLE ip_trie_dictionary_source_table
(
    prefix String
)
ENGINE = TinyLog;

CREATE DICTIONARY `02183_ip_trie_dictionary`
(
    prefix String
)
PRIMARY KEY prefix
SOURCE(clickhouse(TABLE 'ip_trie_dictionary_source_table'))
LIFETIME(0)
LAYOUT(IP_TRIE());

SELECT dictHas('02183_ip_trie_dictionary', tuple(IPv4StringToNum('127.0.0.0')));

SELECT dictHas('02183_ip_trie_dictionary', tuple(IPv4StringToNum('127.0.0.1')));

SELECT *
FROM `02183_ip_trie_dictionary`;

CREATE TABLE `02183_polygon_dictionary_source_table`
(
    key Array(Array(Array(Tuple(Float64, Float64))))
)
ENGINE = TinyLog;

CREATE DICTIONARY `02183_polygon_dictionary`
(
    key Array(Array(Array(Tuple(Float64, Float64))))
)
PRIMARY KEY key
SOURCE(clickhouse(TABLE '02183_polygon_dictionary_source_table'))
LIFETIME(0)
LAYOUT(POLYGON(store_polygon_key_column 1));

SELECT dictHas('02183_polygon_dictionary', tuple(0.5, 0.5));

SELECT dictHas('02183_polygon_dictionary', tuple(1.5, 1.5));

SELECT *
FROM `02183_polygon_dictionary`;

CREATE TABLE `02183_range_dictionary_source_table`
(
    key UInt64,
    start UInt64,
    `end` UInt64
)
ENGINE = TinyLog;

CREATE DICTIONARY `02183_range_dictionary`
(
    key UInt64,
    start UInt64,
    `end` UInt64
)
PRIMARY KEY key
SOURCE(clickhouse(TABLE '02183_range_dictionary_source_table'))
LIFETIME(0)
RANGE(MIN start MAX `end`)
LAYOUT(RANGE_HASHED());

SELECT *
FROM `02183_range_dictionary`;

SELECT dictHas('02183_range_dictionary', 0, 0);

SELECT dictHas('02183_range_dictionary', 0, 2);