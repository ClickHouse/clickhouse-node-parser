SELECT '-- tokenizer must be splitByNonAlpha, ngrams, sparseGrams, splitByString or array.';

SELECT count()
FROM tab
WHERE str = 'foo'
SETTINGS force_data_skipping_indices = 'idx';

SELECT count()
FROM tab
WHERE str_fixed = toFixedString('foo', 3)
SETTINGS force_data_skipping_indices = 'idx_fixed';

SELECT count()
FROM tab
WHERE lc = 'foo'
SETTINGS force_data_skipping_indices = 'idx';

SELECT count()
FROM tab
WHERE lc_fixed = toFixedString('foo', 3)
SETTINGS force_data_skipping_indices = 'idx_fixed';

SELECT count()
FROM tab
WHERE has(arr, 'foo')
SETTINGS force_data_skipping_indices = 'idx';

SELECT count()
FROM tab
WHERE has(arr_fixed, toFixedString('foo', 3))
SETTINGS force_data_skipping_indices = 'idx_fixed';

SELECT count()
FROM tab
WHERE mapContainsKey(map, 'foo')
SETTINGS force_data_skipping_indices = 'idx_keys';

SELECT count()
FROM tab
WHERE mapContainsKey(map_fixed, toFixedString('foo', 3))
SETTINGS force_data_skipping_indices = 'idx_keys_fixed';

SELECT count()
FROM tab
WHERE has(mapValues(map), 'foo')
SETTINGS force_data_skipping_indices = 'idx_values';

SELECT count()
FROM tab
WHERE has(mapValues(map_fixed), toFixedString('foo', 3))
SETTINGS force_data_skipping_indices = 'idx_values_fixed';