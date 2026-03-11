SELECT
    count(),
    sum(marks)
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'test_1m'
    AND active;

SELECT count()
FROM (
        SELECT *
        FROM test_1m
    );