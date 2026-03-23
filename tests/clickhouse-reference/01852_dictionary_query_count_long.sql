CREATE TABLE simple_key_source_table_01862
(
    id UInt64,
    value String
) ENGINE = Memory();
INSERT INTO simple_key_source_table_01862 VALUES (1, 'First');
CREATE DICTIONARY simple_key_flat_dictionary_01862
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'simple_key_source_table_01862'))
LAYOUT(FLAT())
LIFETIME(MIN 1000 MAX 1000);
SELECT * FROM simple_key_flat_dictionary_01862 FORMAT Null;
SELECT name, query_count, status, last_exception FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_flat_dictionary_01862';
SELECT * FROM simple_key_flat_dictionary_01862 WHERE id = 0 FORMAT Null;
SELECT dictGet('simple_key_flat_dictionary_01862', 'value', toUInt64(2)) FORMAT Null;
CREATE DICTIONARY simple_key_direct_dictionary_01862
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'simple_key_source_table_01862'))
LAYOUT(DIRECT());
-- check that found_rate is 0, not nan
SELECT name, query_count, status, last_exception FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_direct_dictionary_01862';
SELECT * FROM simple_key_direct_dictionary_01862 FORMAT Null;
SELECT dictGet('simple_key_direct_dictionary_01862', 'value', toUInt64(1)) FORMAT Null;
SELECT dictGet('simple_key_direct_dictionary_01862', 'value', toUInt64(2)) FORMAT Null;
CREATE DICTIONARY simple_key_hashed_dictionary_01862
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'simple_key_source_table_01862'))
LAYOUT(HASHED())
LIFETIME(MIN 1000 MAX 1000);
SELECT name, query_count, status, last_exception FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_hashed_dictionary_01862';
SELECT dictGet('simple_key_hashed_dictionary_01862', 'value', toUInt64(1)) FORMAT Null;
SELECT dictGet('simple_key_hashed_dictionary_01862', 'value', toUInt64(2)) FORMAT Null;
CREATE DICTIONARY simple_key_sparse_hashed_dictionary_01862
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'simple_key_source_table_01862'))
LAYOUT(SPARSE_HASHED())
LIFETIME(MIN 1000 MAX 1000);
SELECT name, query_count, status, last_exception FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_sparse_hashed_dictionary_01862';
SELECT dictGet('simple_key_sparse_hashed_dictionary_01862', 'value', toUInt64(1)) FORMAT Null;
SELECT dictGet('simple_key_sparse_hashed_dictionary_01862', 'value', toUInt64(2)) FORMAT Null;
CREATE DICTIONARY simple_key_cache_dictionary_01862
(
    id UInt64,
    value String
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'simple_key_source_table_01862'))
LAYOUT(CACHE(SIZE_IN_CELLS 100000))
LIFETIME(MIN 1000 MAX 1000);
SELECT name, query_count, status, last_exception FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_cache_dictionary_01862';
SELECT toUInt64(1) as key, dictGet('simple_key_cache_dictionary_01862', 'value', key) FORMAT Null;
SELECT toUInt64(2) as key, dictGet('simple_key_cache_dictionary_01862', 'value', key) FORMAT Null;
CREATE TABLE complex_key_source_table_01862
(
    id UInt64,
    id_key String,
    value String
) ENGINE = Memory();
INSERT INTO complex_key_source_table_01862 VALUES (1, 'FirstKey', 'First');
CREATE DICTIONARY complex_key_hashed_dictionary_01862
(
    id UInt64,
    id_key String,
    value String
)
PRIMARY KEY id, id_key
SOURCE(CLICKHOUSE(TABLE 'complex_key_source_table_01862'))
LAYOUT(COMPLEX_KEY_HASHED())
LIFETIME(MIN 1000 MAX 1000);
SELECT name, query_count, status, last_exception FROM system.dictionaries WHERE database = currentDatabase() AND name = 'complex_key_hashed_dictionary_01862';
SELECT dictGet('complex_key_hashed_dictionary_01862', 'value', (toUInt64(1), 'FirstKey')) FORMAT Null;
SELECT dictGet('complex_key_hashed_dictionary_01862', 'value', (toUInt64(2), 'FirstKey')) FORMAT Null;
CREATE DICTIONARY complex_key_direct_dictionary_01862
(
    id UInt64,
    id_key String,
    value String
)
PRIMARY KEY id, id_key
SOURCE(CLICKHOUSE(TABLE 'complex_key_source_table_01862'))
LAYOUT(COMPLEX_KEY_DIRECT());
SELECT name, query_count, status, last_exception FROM system.dictionaries WHERE database = currentDatabase() AND name = 'complex_key_direct_dictionary_01862';
SELECT dictGet('complex_key_direct_dictionary_01862', 'value', (toUInt64(1), 'FirstKey')) FORMAT Null;
SELECT dictGet('complex_key_direct_dictionary_01862', 'value', (toUInt64(2), 'FirstKey')) FORMAT Null;
CREATE DICTIONARY complex_key_cache_dictionary_01862
(
    id UInt64,
    id_key String,
    value String
)
PRIMARY KEY id, id_key
SOURCE(CLICKHOUSE(TABLE 'complex_key_source_table_01862'))
LAYOUT(COMPLEX_KEY_CACHE(SIZE_IN_CELLS 100000))
LIFETIME(MIN 1000 MAX 1000);
SELECT name, query_count, status, last_exception FROM system.dictionaries WHERE database = currentDatabase() AND name = 'complex_key_cache_dictionary_01862';
SELECT dictGet('complex_key_cache_dictionary_01862', 'value', (toUInt64(1), 'FirstKey')) FORMAT Null;
SELECT dictGet('complex_key_cache_dictionary_01862', 'value', (toUInt64(2), 'FirstKey')) FORMAT Null;
CREATE TABLE range_key_source_table_01862
(
    id UInt64,
    value String,
    first Date,
    last Date
) ENGINE = Memory();
INSERT INTO range_key_source_table_01862 VALUES (1, 'First', today(), today());
CREATE DICTIONARY simple_key_range_hashed_dictionary_01862
(
    id UInt64,
    value String,
    first Date,
    last Date
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'range_key_source_table_01862'))
LAYOUT(RANGE_HASHED())
RANGE(MIN first MAX last)
LIFETIME(MIN 1000 MAX 1000);
SELECT name, query_count, status, last_exception FROM system.dictionaries WHERE database = currentDatabase() AND name = 'simple_key_range_hashed_dictionary_01862';
SELECT dictGet('simple_key_range_hashed_dictionary_01862', 'value', toUInt64(1), today()) FORMAT Null;
SELECT dictGet('simple_key_range_hashed_dictionary_01862', 'value', toUInt64(2), today()) FORMAT Null;
CREATE TABLE ip_trie_source_table_01862
(
    prefix String,
    value String
) ENGINE = Memory();
INSERT INTO ip_trie_source_table_01862 VALUES ('127.0.0.0/8', 'First');
CREATE DICTIONARY ip_trie_dictionary_01862
(
    prefix String,
    value String
)
PRIMARY KEY prefix
SOURCE(CLICKHOUSE(TABLE 'ip_trie_source_table_01862'))
LAYOUT(IP_TRIE())
LIFETIME(MIN 1000 MAX 1000);
-- found_rate = 0, because we didn't make any searches.
SELECT name, query_count, status, last_exception FROM system.dictionaries WHERE database = currentDatabase() AND name = 'ip_trie_dictionary_01862';
-- found_rate = 1, because the dictionary covers the 127.0.0.1 address.
SELECT dictGet('ip_trie_dictionary_01862', 'value', tuple(toIPv4('127.0.0.1'))) FORMAT Null;
-- found_rate = 0.5, because the dictionary does not cover 1.1.1.1 and we have two lookups in total as of now.
SELECT dictGet('ip_trie_dictionary_01862', 'value', tuple(toIPv4('1.1.1.1'))) FORMAT Null;
CREATE TABLE polygons_01862 (
    key Array(Array(Array(Tuple(Float64, Float64)))),
    name String
) ENGINE = Memory;
INSERT INTO polygons_01862 VALUES ([[[(3, 1), (0, 1), (0, -1), (3, -1)]]], 'Click East');
INSERT INTO polygons_01862 VALUES ([[[(-1, 1), (1, 1), (1, 3), (-1, 3)]]], 'Click North');
INSERT INTO polygons_01862 VALUES ([[[(-3, 1), (-3, -1), (0, -1), (0, 1)]]], 'Click South');
INSERT INTO polygons_01862 VALUES ([[[(-1, -1), (1, -1), (1, -3), (-1, -3)]]], 'Click West');
CREATE TABLE points_01862 (x Float64, y Float64) ENGINE = Memory;
INSERT INTO points_01862 VALUES ( 0.1,  0.0);
INSERT INTO points_01862 VALUES (-0.1,  0.0);
INSERT INTO points_01862 VALUES ( 0.0,  1.1);
INSERT INTO points_01862 VALUES ( 0.0, -1.1);
INSERT INTO points_01862 VALUES ( 3.0,  3.0);
CREATE DICTIONARY polygon_dictionary_01862
(
    key Array(Array(Array(Tuple(Float64, Float64)))),
    name String
)
PRIMARY KEY key
SOURCE(CLICKHOUSE(USER 'default' TABLE 'polygons_01862'))
LIFETIME(0)
LAYOUT(POLYGON());
SELECT name, query_count, status, last_exception FROM system.dictionaries WHERE database = currentDatabase() AND name = 'polygon_dictionary_01862';
SELECT tuple(x, y) as key, dictGet('polygon_dictionary_01862', 'name', key) FROM points_01862 FORMAT Null;
