SELECT element_count FROM system.dictionaries WHERE database = currentDatabase() AND name = 'test_dictionary_10_shards';
SELECT count() FROM test_table WHERE dictGet('test_dictionary_10_shards', 'value', key) != value;
SELECT element_count FROM system.dictionaries WHERE database = currentDatabase() AND name = 'test_dictionary_10_shards_nullable';
SELECT count() FROM test_table_nullable WHERE dictGet('test_dictionary_10_shards_nullable', 'value', key) != value;
SELECT element_count FROM system.dictionaries WHERE database = currentDatabase() and name = 'test_complex_dictionary_10_shards';
SELECT count() FROM test_table_complex WHERE dictGet('test_complex_dictionary_10_shards', 'value', (key_1, key_2)) != value;
