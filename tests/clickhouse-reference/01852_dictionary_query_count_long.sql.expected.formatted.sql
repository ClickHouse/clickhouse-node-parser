SELECT *
FROM simple_key_flat_dictionary_01862
FORMAT Null;

SELECT
    name,
    query_count,
    status,
    last_exception
FROM `system`.dictionaries
WHERE database = currentDatabase()
    AND name = 'simple_key_flat_dictionary_01862';

SELECT *
FROM simple_key_flat_dictionary_01862
WHERE id = 0
FORMAT Null;

SELECT dictGet('simple_key_flat_dictionary_01862', 'value', toUInt64(2))
FORMAT Null;

-- check that found_rate is 0, not nan
SELECT
    name,
    query_count,
    status,
    last_exception
FROM `system`.dictionaries
WHERE database = currentDatabase()
    AND name = 'simple_key_direct_dictionary_01862';

SELECT *
FROM simple_key_direct_dictionary_01862
FORMAT Null;

SELECT dictGet('simple_key_direct_dictionary_01862', 'value', toUInt64(1))
FORMAT Null;

SELECT dictGet('simple_key_direct_dictionary_01862', 'value', toUInt64(2))
FORMAT Null;

SELECT
    name,
    query_count,
    status,
    last_exception
FROM `system`.dictionaries
WHERE database = currentDatabase()
    AND name = 'simple_key_hashed_dictionary_01862';

SELECT dictGet('simple_key_hashed_dictionary_01862', 'value', toUInt64(1))
FORMAT Null;

SELECT dictGet('simple_key_hashed_dictionary_01862', 'value', toUInt64(2))
FORMAT Null;

SELECT
    name,
    query_count,
    status,
    last_exception
FROM `system`.dictionaries
WHERE database = currentDatabase()
    AND name = 'simple_key_sparse_hashed_dictionary_01862';

SELECT dictGet('simple_key_sparse_hashed_dictionary_01862', 'value', toUInt64(1))
FORMAT Null;

SELECT dictGet('simple_key_sparse_hashed_dictionary_01862', 'value', toUInt64(2))
FORMAT Null;

SELECT
    name,
    query_count,
    status,
    last_exception
FROM `system`.dictionaries
WHERE database = currentDatabase()
    AND name = 'simple_key_cache_dictionary_01862';

SELECT
    toUInt64(1) AS key,
    dictGet('simple_key_cache_dictionary_01862', 'value', key)
FORMAT Null;

SELECT
    toUInt64(2) AS key,
    dictGet('simple_key_cache_dictionary_01862', 'value', key)
FORMAT Null;

SELECT
    name,
    query_count,
    status,
    last_exception
FROM `system`.dictionaries
WHERE database = currentDatabase()
    AND name = 'complex_key_hashed_dictionary_01862';

SELECT dictGet('complex_key_hashed_dictionary_01862', 'value', (toUInt64(1), 'FirstKey'))
FORMAT Null;

SELECT dictGet('complex_key_hashed_dictionary_01862', 'value', (toUInt64(2), 'FirstKey'))
FORMAT Null;

SELECT
    name,
    query_count,
    status,
    last_exception
FROM `system`.dictionaries
WHERE database = currentDatabase()
    AND name = 'complex_key_direct_dictionary_01862';

SELECT dictGet('complex_key_direct_dictionary_01862', 'value', (toUInt64(1), 'FirstKey'))
FORMAT Null;

SELECT dictGet('complex_key_direct_dictionary_01862', 'value', (toUInt64(2), 'FirstKey'))
FORMAT Null;

SELECT
    name,
    query_count,
    status,
    last_exception
FROM `system`.dictionaries
WHERE database = currentDatabase()
    AND name = 'complex_key_cache_dictionary_01862';

SELECT dictGet('complex_key_cache_dictionary_01862', 'value', (toUInt64(1), 'FirstKey'))
FORMAT Null;

SELECT dictGet('complex_key_cache_dictionary_01862', 'value', (toUInt64(2), 'FirstKey'))
FORMAT Null;

SELECT
    name,
    query_count,
    status,
    last_exception
FROM `system`.dictionaries
WHERE database = currentDatabase()
    AND name = 'simple_key_range_hashed_dictionary_01862';

SELECT dictGet('simple_key_range_hashed_dictionary_01862', 'value', toUInt64(1), today())
FORMAT Null;

SELECT dictGet('simple_key_range_hashed_dictionary_01862', 'value', toUInt64(2), today())
FORMAT Null;

-- found_rate = 0, because we didn't make any searches.
SELECT
    name,
    query_count,
    status,
    last_exception
FROM `system`.dictionaries
WHERE database = currentDatabase()
    AND name = 'ip_trie_dictionary_01862';

-- found_rate = 1, because the dictionary covers the 127.0.0.1 address.
SELECT dictGet('ip_trie_dictionary_01862', 'value', tuple(toIPv4('127.0.0.1')))
FORMAT Null;

-- found_rate = 0.5, because the dictionary does not cover 1.1.1.1 and we have two lookups in total as of now.
SELECT dictGet('ip_trie_dictionary_01862', 'value', tuple(toIPv4('1.1.1.1')))
FORMAT Null;

SELECT
    name,
    query_count,
    status,
    last_exception
FROM `system`.dictionaries
WHERE database = currentDatabase()
    AND name = 'polygon_dictionary_01862';

SELECT
    tuple(x, y) AS key,
    dictGet('polygon_dictionary_01862', 'name', key)
FROM points_01862
FORMAT Null;