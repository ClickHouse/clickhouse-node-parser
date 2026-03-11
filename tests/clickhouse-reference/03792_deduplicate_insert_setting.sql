SELECT 'case: sync insert, insert_deduplicate=1 is main setting', * FROM test ORDER BY id;
SELECT 'case: sync insert, insert_deduplicate=0 is main setting', * FROM test ORDER BY id;
SELECT 'case: sync insert, deduplicate_insert=\'ENABLE\' is main setting', * FROM test ORDER BY id;
SELECT 'case: sync insert, deduplicate_insert=\'DISABLE\' is main setting', * FROM test ORDER BY id;
SELECT 'case: async insert, async_insert_deduplicate=1 is main setting', * FROM test ORDER BY id;
SELECT 'case: async insert, async_insert_deduplicate=0 is main setting', * FROM test ORDER BY id;
SELECT 'case: async insert, deduplicate_insert=\'ENABLE\' is main setting', * FROM test ORDER BY id;
SELECT 'case: async insert, deduplicate_insert=\'DISABLE\' is main setting', * FROM test ORDER BY id;
