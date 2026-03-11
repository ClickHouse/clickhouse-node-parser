SELECT count()
FROM test_03096;

SELECT count()
FROM test_03096
WHERE b = 0;

SELECT
    latest_fail_reason == '',
    is_done == 1
FROM `system`.mutations
WHERE table = 'test_03096'
    AND database = currentDatabase();