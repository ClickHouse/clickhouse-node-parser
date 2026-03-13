SELECT dictGet('flat_dictionary', 'value', toUInt64(0));

SELECT dictGet('flat_dictionary', 'value', toUInt64(1));

SELECT dictGet('flat_dictionary', 'value', toUInt64(2));

SELECT dictGetOrDefault('flat_dictionary', 'value', toUInt64(2), 2);

SELECT dictGetOrDefault('flat_dictionary', 'value', toUInt64(2), NULL);

SELECT dictGetOrDefault('flat_dictionary', 'value', id, value)
FROM dictionary_nullable_default_source_table;

SELECT dictGet('hashed_dictionary', 'value', toUInt64(0));

SELECT dictGet('hashed_dictionary', 'value', toUInt64(1));

SELECT dictGet('hashed_dictionary', 'value', toUInt64(2));

SELECT dictGetOrDefault('hashed_dictionary', 'value', toUInt64(2), 2);

SELECT dictGetOrDefault('hashed_dictionary', 'value', toUInt64(2), NULL);

SELECT dictGetOrDefault('hashed_dictionary', 'value', id, value)
FROM dictionary_nullable_default_source_table;

SELECT dictGet('cache_dictionary', 'value', toUInt64(0));

SELECT dictGet('cache_dictionary', 'value', toUInt64(1));

SELECT dictGet('cache_dictionary', 'value', toUInt64(2));

SELECT dictGetOrDefault('cache_dictionary', 'value', toUInt64(2), 2);

SELECT dictGetOrDefault('cache_dictionary', 'value', toUInt64(2), NULL);

SELECT dictGetOrDefault('cache_dictionary', 'value', id, value)
FROM dictionary_nullable_default_source_table;

SELECT dictGet('direct_dictionary', 'value', toUInt64(0));

SELECT dictGet('direct_dictionary', 'value', toUInt64(1));

SELECT dictGet('direct_dictionary', 'value', toUInt64(2));

SELECT dictGetOrDefault('direct_dictionary', 'value', toUInt64(2), 2);

SELECT dictGetOrDefault('direct_dictionary', 'value', toUInt64(2), NULL);

SELECT dictGetOrDefault('direct_dictionary', 'value', id, value)
FROM dictionary_nullable_default_source_table;

SELECT dictGet('ip_trie_dictionary', 'value', tuple(IPv4StringToNum('127.0.0.0'))); --{serverError UNSUPPORTED_METHOD}

SELECT dictGet('polygon_dictionary', 'value', tuple(0.5, 0.5));

SELECT dictGet('polygon_dictionary', 'value', tuple(1.5, 1.5));

SELECT dictGet('polygon_dictionary', 'value', tuple(2.0, 2.0));

SELECT dictGetOrDefault('polygon_dictionary', 'value', tuple(2.0, 2.0), 2);

SELECT dictGetOrDefault('polygon_dictionary', 'value', tuple(2.0, 2.0), NULL);

SELECT dictGetOrDefault('polygon_dictionary', 'value', key, value)
FROM polygon_dictionary_nullable_default_source_table;

SELECT dictGet('range_dictionary', 'value', toUInt64(0), toDate('2019-05-15'));

SELECT dictGet('range_dictionary', 'value', toUInt64(1), toDate('2019-05-15'));

SELECT dictGet('range_dictionary', 'value', toUInt64(2), toDate('2019-05-15'));

SELECT dictGetOrDefault('range_dictionary', 'value', toUInt64(2), toDate('2019-05-15'), 2);

SELECT dictGetOrDefault('range_dictionary', 'value', toUInt64(2), toDate('2019-05-15'), NULL);

SELECT dictGetOrDefault('range_dictionary', 'value', key, toDate('2019-05-15'), value)
FROM range_dictionary_nullable_default_source_table;