SELECT arr
FROM index_test
WHERE has(arrayMap(x -> lower(x), arr), lower('a_12'))
SETTINGS enable_analyzer = 1;

SELECT arr
FROM index_test
WHERE has(arrayMap((x, y) -> concat(lower(x), y), arr, arr), 'a_12A_12')
SETTINGS enable_analyzer = 1;

SELECT arr
FROM index_test
WHERE has(arrayMap((x, y) -> concat(lower(x), y, '_', toString(id)), arr, arr), 'a_12A_12_13')
SETTINGS enable_analyzer = 1;