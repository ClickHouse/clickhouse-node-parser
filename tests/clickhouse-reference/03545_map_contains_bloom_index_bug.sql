SELECT * FROM test_map_contains_values WHERE mapContains(ResourceAttributes, 'rum.sessionId');
SELECT * FROM test_map_contains_values WHERE mapContainsKey(ResourceAttributes, 'rum.sessionId');
SELECT * FROM test_map_contains_values WHERE mapContainsValue(ResourceAttributes, 'session123');
SELECT * FROM test_map_contains_keys WHERE mapContains(ResourceAttributes, 'rum.sessionId');
SELECT * FROM test_map_contains_keys WHERE mapContainsKey(ResourceAttributes, 'rum.sessionId');
SELECT * FROM test_map_contains_keys WHERE mapContainsValue(ResourceAttributes, 'session123');
