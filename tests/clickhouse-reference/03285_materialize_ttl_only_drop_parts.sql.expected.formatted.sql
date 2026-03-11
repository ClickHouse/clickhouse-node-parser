SELECT
    'Rows in parts',
    SUM(`rows`)
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'test_03285_mat_ttl'
    AND active;

SELECT
    'Count',
    count()
FROM test_03285_mat_ttl;