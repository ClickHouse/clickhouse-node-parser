SELECT json
FROM test
ORDER BY x ASC
LIMIT 10
OFFSET 120000;

SELECT
    json.key0,
    json.key1,
    json.key2,
    json.key3,
    json.key4,
    json.key5
FROM test
ORDER BY x ASC
LIMIT 10
OFFSET 120000;