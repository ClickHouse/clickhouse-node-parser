SELECT
    id,
    '1997-02-01' AS create_time
FROM test
WHERE test.create_time = '1970-02-01 00:00:00'
ORDER BY id ASC;