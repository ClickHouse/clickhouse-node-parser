SELECT dictGet('flat_dictionary', 'decimal_value', toUInt64(1));

SELECT dictGet('hashed_dictionary', 'decimal_value', toUInt64(1));

SELECT dictGet('cache_dictionary', 'decimal_value', toUInt64(1));

SELECT dictGet('direct_dictionary', 'decimal_value', toUInt64(1));

SELECT dictGet('ip_trie_dictionary', 'decimal_value', tuple(IPv4StringToNum('127.0.0.0')));

SELECT dictGet('polygon_dictionary', 'decimal_value', tuple(0.5, 0.5));