-- Verify the column still has its original name (c0) since the ALTER was rejected
SELECT *
FROM test_alter_atomic;

SELECT name
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 'test_alter_atomic';

SELECT *
FROM test_alter_atomic
ORDER BY c0 ASC;

-- Verify column still has original name
SELECT name
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 'test_alter_atomic'
ORDER BY position ASC;

SELECT *
FROM test_alter_atomic
ORDER BY key ASC;

-- Wait for mutation to complete
SELECT sleepEachRow(0.1)
FROM numbers(30)
SETTINGS function_sleep_max_microseconds_per_block = 10000000
FORMAT Null;

SELECT
    key,
    c0,
    c2
FROM test_alter_atomic;