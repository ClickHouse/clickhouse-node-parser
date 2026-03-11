SELECT n1.c1
FROM s3('http://localhost:11111/test/test-data-03644_object_storage.csv', 'test', 'testtest') AS n1
WHERE n1.c1 > (
        SELECT AVG(n2.c1)
        FROM s3('http://localhost:11111/test/test-data-03644_object_storage.csv', 'test', 'testtest') AS n2
        WHERE n2.c1 < n1.c1
    )
ORDER BY n1.c1 ASC
SETTINGS allow_experimental_correlated_subqueries = 1;