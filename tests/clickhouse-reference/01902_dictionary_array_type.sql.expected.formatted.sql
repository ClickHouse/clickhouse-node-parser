SELECT dictGet('flat_dictionary', 'array_value', toUInt64(0));

SELECT dictGet('flat_dictionary', 'array_value', toUInt64(1));

SELECT dictGetOrDefault('flat_dictionary', 'array_value', toUInt64(1), [2,3,4]);

SELECT dictGet('hashed_dictionary', 'array_value', toUInt64(0));

SELECT dictGet('hashed_dictionary', 'array_value', toUInt64(1));

SELECT dictGetOrDefault('hashed_dictionary', 'array_value', toUInt64(1), [2,3,4]);

SELECT dictGet('cache_dictionary', 'array_value', toUInt64(0));

SELECT dictGet('cache_dictionary', 'array_value', toUInt64(1));

SELECT dictGetOrDefault('cache_dictionary', 'array_value', toUInt64(1), [2,3,4]);

SELECT dictGet('direct_dictionary', 'array_value', toUInt64(0));

SELECT dictGet('direct_dictionary', 'array_value', toUInt64(1));

SELECT dictGetOrDefault('direct_dictionary', 'array_value', toUInt64(1), [2,3,4]);

SELECT dictGet('ip_trie_dictionary', 'array_value', tuple(IPv4StringToNum('127.0.0.0')));

SELECT dictGet('ip_trie_dictionary', 'array_value', tuple(IPv4StringToNum('128.0.0.0')));

SELECT dictGetOrDefault('ip_trie_dictionary', 'array_value', tuple(IPv4StringToNum('128.0.0.0')), [2,3,4]);

SELECT dictGet('polygon_dictionary', 'array_value', tuple(0.5, 0.5));

SELECT dictGet('polygon_dictionary', 'array_value', tuple(1.5, 1.5));

SELECT dictGetOrDefault('polygon_dictionary', 'array_value', tuple(1.5, 1.5), [2, 3, 4]);

SELECT dictGet('range_dictionary', 'array_value', toUInt64(1), toDate('2019-05-15'));

SELECT dictGet('range_dictionary', 'array_value', toUInt64(1), toDate('2019-05-21'));

SELECT dictGetOrDefault('range_dictionary', 'array_value', toUInt64(1), toDate('2019-05-21'), [2, 3, 4]);