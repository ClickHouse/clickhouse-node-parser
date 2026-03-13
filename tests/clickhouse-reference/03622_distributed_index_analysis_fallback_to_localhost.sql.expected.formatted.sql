SELECT
    count(),
    sum(marks)
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'test_1m'
    AND active;

-- { echo }
SELECT count()
FROM test_1m
WHERE key > 10000
SETTINGS distributed_index_analysis = 0;

SELECT count()
FROM test_1m
WHERE key > 10000
SETTINGS distributed_index_analysis = 1;