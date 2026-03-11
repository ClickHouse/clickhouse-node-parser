SELECT count()
FROM test_startsWith
WHERE startsWith(a, 'a')
SETTINGS force_primary_key = 1;

SELECT count()
FROM test_startsWith
WHERE startsWith(a, 'abc')
SETTINGS force_primary_key = 1;