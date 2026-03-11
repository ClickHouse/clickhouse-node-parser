SELECT
    'Rows in parts',
    SUM(`rows`)
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'lwd_test_02521'
    AND active;

SELECT
    'Count',
    count()
FROM lwd_test_02521;