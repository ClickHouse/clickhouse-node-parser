SELECT value
FROM `system`.rocksdb
WHERE database = currentDatabase()
    AND table = '01686_test'
    AND name = 'number.keys.written';

SELECT *
FROM `01686_test`
WHERE key = 123;

SELECT '--';

SELECT *
FROM `01686_test`
WHERE key = -123;

SELECT *
FROM `01686_test`
WHERE key = 123
    OR key = 4567
ORDER BY key ASC;

SELECT *
FROM `01686_test`
WHERE key = NULL;

SELECT *
FROM `01686_test`
WHERE key = NULL
    OR key = 0;

SELECT *
FROM `01686_test`
WHERE key IN (123, 456, -123)
ORDER BY key ASC;

SELECT *
FROM `01686_test`
WHERE key = 'Hello';

SELECT *
FROM `01686_test`
WHERE key IN (99, 999, 9999, -123)
ORDER BY key ASC;