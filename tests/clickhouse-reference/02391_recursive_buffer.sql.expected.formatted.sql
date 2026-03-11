SELECT *
FROM test;

SELECT *
FROM `system`.tables
WHERE table = 'test'
    AND database = currentDatabase()
FORMAT Null;