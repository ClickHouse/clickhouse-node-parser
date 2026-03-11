SELECT element_count
FROM `system`.dictionaries
WHERE database = currentDatabase()
    AND name = 'test_sparse_dictionary_load_factor';

SELECT count()
FROM test_table
WHERE dictGet('test_sparse_dictionary_load_factor', 'value', key) != value;

SELECT element_count
FROM `system`.dictionaries
WHERE database = currentDatabase()
    AND name = 'test_dictionary_load_factor';

SELECT count()
FROM test_table
WHERE dictGet('test_dictionary_load_factor', 'value', key) != value;

SELECT element_count
FROM `system`.dictionaries
WHERE database = currentDatabase()
    AND name = 'test_dictionary_load_factor_nullable';

SELECT count()
FROM test_table_nullable
WHERE dictGet('test_dictionary_load_factor_nullable', 'value', key) != value;

SELECT element_count
FROM `system`.dictionaries
WHERE database = currentDatabase()
    AND name = 'test_complex_dictionary_load_factor';

SELECT count()
FROM test_table_complex
WHERE dictGet('test_complex_dictionary_load_factor', 'value', (key_1, key_2)) != value;