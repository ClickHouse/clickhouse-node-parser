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
CREATE DICTIONARY test_dictionary_10_shards
(
    key UInt64,
    value UInt16
) PRIMARY KEY key
SOURCE(CLICKHOUSE(TABLE test_table))
LAYOUT(SPARSE_HASHED(SHARDS 10))
LIFETIME(0);
SELECT element_count FROM system.dictionaries WHERE database = currentDatabase() AND name = 'test_dictionary_10_shards';
SELECT count() FROM test_table WHERE dictGet('test_dictionary_10_shards', 'value', key) != value;
CREATE DICTIONARY test_dictionary_10_shards_nullable
(
    key UInt64,
    value Nullable(UInt16)
) PRIMARY KEY key
SOURCE(CLICKHOUSE(TABLE test_table_nullable))
LAYOUT(SPARSE_HASHED(SHARDS 10))
LIFETIME(0);
SELECT element_count FROM system.dictionaries WHERE database = currentDatabase() AND name = 'test_dictionary_10_shards_nullable';
SELECT count() FROM test_table_nullable WHERE dictGet('test_dictionary_10_shards_nullable', 'value', key) != value;
CREATE DICTIONARY test_complex_dictionary_10_shards
(
    key_1 UInt64,
    key_2 UInt64,
    value UInt16
) PRIMARY KEY key_1, key_2
SOURCE(CLICKHOUSE(TABLE test_table_complex))
LAYOUT(COMPLEX_KEY_SPARSE_HASHED(SHARDS 10))
LIFETIME(0);
SELECT element_count FROM system.dictionaries WHERE database = currentDatabase() and name = 'test_complex_dictionary_10_shards';
SELECT count() FROM test_table_complex WHERE dictGet('test_complex_dictionary_10_shards', 'value', (key_1, key_2)) != value;
CREATE DICTIONARY test_dictionary_10_shards_string
(
    key String,
    value UInt16
) PRIMARY KEY key
SOURCE(CLICKHOUSE(TABLE test_table_string))
LAYOUT(SPARSE_HASHED(SHARDS 10))
LIFETIME(0);
CREATE DICTIONARY test_dictionary_10_shards_incremental
(
    key UInt64,
    value UInt16
) PRIMARY KEY key
SOURCE(CLICKHOUSE(TABLE test_table_last_access UPDATE_FIELD last_access))
LAYOUT(SPARSE_HASHED(SHARDS 10))
LIFETIME(0);
