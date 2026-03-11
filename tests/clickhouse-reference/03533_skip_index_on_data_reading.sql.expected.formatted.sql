SELECT *
FROM test
WHERE region = 'europe'
    AND user_id = 101
ORDER BY `ALL` ASC
SETTINGS log_comment = 'test_1';

SELECT *
FROM test
WHERE region = 'unknown'
    AND user_id = 101
ORDER BY `ALL` ASC
SETTINGS log_comment = 'test_2';

SELECT *
FROM test
WHERE region = 'us_west'
    AND user_id = 106
ORDER BY `ALL` ASC
SETTINGS log_comment = 'test_3';

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

SELECT *
FROM test_partial_index
WHERE region = 'europe'
    AND user_id = 101
ORDER BY `ALL` ASC
SETTINGS log_comment = 'test_partial_1';

SELECT *
FROM test_partial_index
WHERE region = 'unknown'
    AND user_id = 101
ORDER BY `ALL` ASC
SETTINGS log_comment = 'test_partial_2';

SELECT *
FROM test_partial_index
WHERE region = 'us_west'
    AND user_id = 106
ORDER BY `ALL` ASC
SETTINGS log_comment = 'test_partial_3';

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