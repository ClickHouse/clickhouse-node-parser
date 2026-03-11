SELECT count()
FROM test_01778
WHERE key = 'xxx';

SELECT count()
FROM test_01778
WHERE key = toFixedString('xxx', 3);

SELECT count()
FROM test_01778
WHERE toString(key) = 'xxx';