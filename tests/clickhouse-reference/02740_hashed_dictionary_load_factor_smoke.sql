CREATE TABLE test_table
(
    key UInt64,
    value UInt16
) ENGINE=Memory() AS SELECT number, number FROM numbers(1e5);
CREATE TABLE test_table_nullable
(
    key UInt64,
    value Nullable(UInt16)
) ENGINE=Memory() AS SELECT number, number % 2 == 0 ? NULL : number FROM numbers(1e5);
CREATE TABLE test_table_string
(
    key String,
    value UInt16
) ENGINE=Memory() AS SELECT 'foo' || number::String, number FROM numbers(1e5);
CREATE TABLE test_table_complex
(
    key_1 UInt64,
    key_2 UInt64,
    value UInt16
) ENGINE=Memory() AS SELECT number, number, number FROM numbers(1e5);
CREATE DICTIONARY test_sparse_dictionary_load_factor
(
    key UInt64,
    value UInt16
) PRIMARY KEY key
SOURCE(CLICKHOUSE(TABLE test_table))
LAYOUT(SPARSE_HASHED(MAX_LOAD_FACTOR 0.90))
LIFETIME(0);
SELECT element_count FROM system.dictionaries WHERE database = currentDatabase() AND name = 'test_sparse_dictionary_load_factor';
SELECT count() FROM test_table WHERE dictGet('test_sparse_dictionary_load_factor', 'value', key) != value;
CREATE DICTIONARY test_dictionary_load_factor
(
    key UInt64,
    value UInt16
) PRIMARY KEY key
SOURCE(CLICKHOUSE(TABLE test_table))
LAYOUT(HASHED(MAX_LOAD_FACTOR 0.90))
LIFETIME(0);
SELECT element_count FROM system.dictionaries WHERE database = currentDatabase() AND name = 'test_dictionary_load_factor';
SELECT count() FROM test_table WHERE dictGet('test_dictionary_load_factor', 'value', key) != value;
CREATE DICTIONARY test_dictionary_load_factor_nullable
(
    key UInt64,
    value Nullable(UInt16)
) PRIMARY KEY key
SOURCE(CLICKHOUSE(TABLE test_table_nullable))
LAYOUT(HASHED(MAX_LOAD_FACTOR 0.90))
LIFETIME(0);
SELECT element_count FROM system.dictionaries WHERE database = currentDatabase() AND name = 'test_dictionary_load_factor_nullable';
SELECT count() FROM test_table_nullable WHERE dictGet('test_dictionary_load_factor_nullable', 'value', key) != value;
CREATE DICTIONARY test_complex_dictionary_load_factor
(
    key_1 UInt64,
    key_2 UInt64,
    value UInt16
) PRIMARY KEY key_1, key_2
SOURCE(CLICKHOUSE(TABLE test_table_complex))
LAYOUT(COMPLEX_KEY_HASHED(MAX_LOAD_FACTOR 0.90))
LIFETIME(0);
SELECT element_count FROM system.dictionaries WHERE database = currentDatabase() and name = 'test_complex_dictionary_load_factor';
SELECT count() FROM test_table_complex WHERE dictGet('test_complex_dictionary_load_factor', 'value', (key_1, key_2)) != value;
CREATE DICTIONARY test_dictionary_load_factor_string
(
    key String,
    value UInt16
) PRIMARY KEY key
SOURCE(CLICKHOUSE(TABLE test_table_string))
LAYOUT(HASHED(MAX_LOAD_FACTOR 1))
LIFETIME(0);
