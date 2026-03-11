SELECT COUNT()
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'test_table'
    AND active = 1;

SELECT '--';

SELECT
    id,
    value
FROM test_table FINAL
ORDER BY id ASC;