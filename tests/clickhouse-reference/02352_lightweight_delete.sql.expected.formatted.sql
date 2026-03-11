SELECT
    'Rows in parts',
    SUM(`rows`)
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'lwd_test'
    AND active;

SELECT
    'Count',
    count()
FROM lwd_test;

SELECT
    'First row',
    id,
    length(value)
FROM lwd_test
ORDER BY id ASC
LIMIT 1;