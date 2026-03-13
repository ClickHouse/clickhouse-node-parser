-- agree on one granule
SELECT *
FROM test
WHERE region = 'europe'
    AND user_id = 101
ORDER BY `ALL` ASC
SETTINGS log_comment = 'test_1';

-- all filtered
SELECT *
FROM test
WHERE region = 'unknown'
    AND user_id = 101
ORDER BY `ALL` ASC
SETTINGS log_comment = 'test_2';

-- narrowing filter via user_id_idx
SELECT *
FROM test
WHERE region = 'us_west'
    AND user_id = 106
ORDER BY `ALL` ASC
SETTINGS log_comment = 'test_3';

-- test with an OR filter - 3 rows/granules for user_id=101 union 3 rows/granules for 'asia'
SELECT *
FROM test
WHERE region = 'asia'
    OR user_id = 101
ORDER BY `ALL` ASC
SETTINGS log_comment = 'test_4';

SELECT
    ProfileEvents['RowsReadByPrewhereReaders'],
    ProfileEvents['RowsReadByMainReader']
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND log_comment = 'test_1';

SELECT
    ProfileEvents['RowsReadByPrewhereReaders'],
    ProfileEvents['RowsReadByMainReader']
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND log_comment = 'test_2';

SELECT
    ProfileEvents['RowsReadByPrewhereReaders'],
    ProfileEvents['RowsReadByMainReader']
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND log_comment = 'test_3';

SELECT
    ProfileEvents['RowsReadByPrewhereReaders'],
    ProfileEvents['RowsReadByMainReader']
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND log_comment = 'test_4';

-- agree on one granule
SELECT *
FROM test_partial_index
WHERE region = 'europe'
    AND user_id = 101
ORDER BY `ALL` ASC
SETTINGS log_comment = 'test_partial_1';

-- all filtered
SELECT *
FROM test_partial_index
WHERE region = 'unknown'
    AND user_id = 101
ORDER BY `ALL` ASC
SETTINGS log_comment = 'test_partial_2';

-- narrowing filter via user_id_idx
SELECT *
FROM test_partial_index
WHERE region = 'us_west'
    AND user_id = 106
ORDER BY `ALL` ASC
SETTINGS log_comment = 'test_partial_3';

-- Skip indexes on OR supported.
-- All 5 rows from part1 (no skip indexes) +
-- All 5 rows from part2 (because no index on user_id) +
-- 2 rows from part3 -> 1 row each for region='asia' and user_id=101.
-- Total 12
SELECT *
FROM test_partial_index
WHERE region = 'asia'
    OR user_id = 101
ORDER BY `ALL` ASC
SETTINGS log_comment = 'test_partial_4';

SELECT
    ProfileEvents['RowsReadByPrewhereReaders'],
    ProfileEvents['RowsReadByMainReader']
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND log_comment = 'test_partial_1';

SELECT
    ProfileEvents['RowsReadByPrewhereReaders'],
    ProfileEvents['RowsReadByMainReader']
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND log_comment = 'test_partial_2';

SELECT
    ProfileEvents['RowsReadByPrewhereReaders'],
    ProfileEvents['RowsReadByMainReader']
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND log_comment = 'test_partial_3';

SELECT
    ProfileEvents['RowsReadByPrewhereReaders'],
    ProfileEvents['RowsReadByMainReader']
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND log_comment = 'test_partial_4';