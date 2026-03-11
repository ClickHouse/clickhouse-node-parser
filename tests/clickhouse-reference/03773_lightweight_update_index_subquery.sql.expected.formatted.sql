SELECT count()
FROM test_lwd
WHERE id IN (
        SELECT number
        FROM numbers(10000, 3)
    );

SELECT count()
FROM test_lwd
WHERE id IN (
        SELECT number
        FROM numbers(10003, 3)
    );

SELECT count()
FROM test_lwd
WHERE id IN (
        SELECT number
        FROM numbers(10006, 3)
    );