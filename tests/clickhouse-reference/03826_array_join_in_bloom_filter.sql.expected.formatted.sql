SELECT id
FROM test_array_bloom
WHERE has(data, 'ccc');

SELECT id
FROM
    test_array_bloom
ARRAY JOIN data
WHERE data IN ('aaa')
ORDER BY id ASC;