SELECT * FROM test_01676.table ORDER BY x;
SELECT status FROM system.dictionaries WHERE database='test_01676' AND name='dict';
-- It can be not loaded, or not even finish attaching in case of asynchronous tables loading.
SELECT COALESCE((SELECT status FROM system.dictionaries WHERE database='test_01676' AND name='dict')::Nullable(String), 'NOT_LOADED');
