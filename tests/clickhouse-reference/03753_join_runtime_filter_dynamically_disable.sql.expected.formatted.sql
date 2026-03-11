SELECT count()
FROM
    customer
CROSS JOIN nation
WHERE c_nationkey = n_nationkey
    AND n_name = 'FRANCE'
    AND c_nationkey_copy = 6
SETTINGS
    join_runtime_filter_exact_values_limit = 100,
    max_block_size = 10,
    max_threads = 1,
    log_comment = 'Q1';

SELECT
    log_comment,
    ProfileEvents['RuntimeFilterBlocksSkipped'] > 10 * ProfileEvents['RuntimeFilterBlocksProcessed'] AS Passed,
    if(Passed, 'Ok', concat(query_id, ' : ', ProfileEvents::String))
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND log_comment = 'Q1'
    AND current_database = currentDatabase()
    AND event_time > now() - toIntervalMinute(30);

SELECT count()
FROM
    customer
CROSS JOIN nation
WHERE c_nationkey = n_nationkey
    AND n_name IN ('FRANCE', 'GERMANY')
    AND c_nationkey_copy IN (6, 7)
SETTINGS
    join_runtime_filter_exact_values_limit = 100,
    max_block_size = 10,
    max_threads = 1,
    log_comment = 'Q2';

SELECT
    log_comment,
    ProfileEvents['RuntimeFilterBlocksSkipped'] > 10 * ProfileEvents['RuntimeFilterBlocksProcessed'] AS Passed,
    if(Passed, 'Ok', concat(query_id, ' : ', ProfileEvents::String))
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND log_comment = 'Q2'
    AND current_database = currentDatabase()
    AND event_time > now() - toIntervalMinute(30);

SELECT count()
FROM
    customer
CROSS JOIN nation
WHERE c_nationkey = n_nationkey
    AND n_name IN ('FRANCE', 'GERMANY', 'ETHIOPIA')
    AND c_nationkey_copy IN (6, 7, 5)
SETTINGS
    join_runtime_filter_exact_values_limit = 1,
    max_block_size = 10,
    max_threads = 1,
    log_comment = 'Q3';

SELECT
    log_comment,
    ProfileEvents['RuntimeFilterBlocksSkipped'] > 10 * ProfileEvents['RuntimeFilterBlocksProcessed'] AS Passed,
    if(Passed, 'Ok', concat(query_id, ' : ', ProfileEvents::String))
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND log_comment = 'Q3'
    AND current_database = currentDatabase()
    AND event_time > now() - toIntervalMinute(30);

SELECT count()
FROM
    customer
CROSS JOIN numbers(2000) AS n
WHERE c_nationkey = n.number::Int32
SETTINGS
    join_runtime_filter_exact_values_limit = 1,
    join_runtime_bloom_filter_bytes = 100,
    max_block_size = 10,
    max_threads = 1,
    log_comment = 'Q4';

SELECT
    log_comment,
    ProfileEvents['RuntimeFilterBlocksSkipped'] > 10
    AND ProfileEvents['RuntimeFilterBlocksProcessed'] = 0 AS Passed,
    if(Passed, 'Ok', concat(query_id, ' : ', ProfileEvents::String))
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND log_comment = 'Q4'
    AND current_database = currentDatabase()
    AND event_time > now() - toIntervalMinute(30);

SELECT count()
FROM
    (
        SELECT *
        FROM customer
        WHERE c_nationkey_copy != 6
    ) AS c
LEFT JOIN (
        SELECT *
        FROM nation
        WHERE n_name = 'FRANCE'
    ) AS n
    ON c.c_nationkey = n.n_nationkey
SETTINGS
    join_runtime_filter_exact_values_limit = 100,
    max_block_size = 10,
    max_threads = 1,
    log_comment = 'Q5';

SELECT
    log_comment,
    ProfileEvents['RuntimeFilterBlocksSkipped'] > 10 * ProfileEvents['RuntimeFilterBlocksProcessed'] AS Passed,
    if(Passed, 'Ok', concat(query_id, ' : ', ProfileEvents::String))
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND log_comment = 'Q5'
    AND current_database = currentDatabase()
    AND event_time > now() - toIntervalMinute(30);

SELECT count()
FROM
    (
        SELECT *
        FROM customer
        WHERE c_nationkey_copy NOT IN (6, 7)
    ) AS c
LEFT JOIN (
        SELECT *
        FROM nation
        WHERE n_name IN ('FRANCE', 'GERMANY')
    ) AS n
    ON c.c_nationkey = n.n_nationkey
SETTINGS
    join_runtime_filter_exact_values_limit = 100,
    max_block_size = 10,
    max_threads = 1,
    log_comment = 'Q6';

SELECT
    log_comment,
    ProfileEvents['RuntimeFilterBlocksSkipped'] > 10 * ProfileEvents['RuntimeFilterBlocksProcessed'] AS Passed,
    if(Passed, 'Ok', concat(query_id, ' : ', ProfileEvents::String))
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND log_comment = 'Q6'
    AND current_database = currentDatabase()
    AND event_time > now() - toIntervalMinute(30);

SELECT count()
FROM
    customer
CROSS JOIN nation
WHERE c_nationkey = n_nationkey
    AND n_name = 'FRANCE'
    AND c_nationkey_copy = 6
SETTINGS
    join_runtime_filter_pass_ratio_threshold_for_disabling = 3.14,
    max_block_size = 10,
    max_threads = 1,
    log_comment = 'Q7';

SELECT
    log_comment,
    ProfileEvents['RuntimeFilterBlocksSkipped'] = 0
    AND ProfileEvents['RuntimeFilterBlocksProcessed'] > 0 AS Passed,
    if(Passed, 'Ok', concat(query_id, ' : ', ProfileEvents::String))
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND log_comment = 'Q7'
    AND current_database = currentDatabase()
    AND event_time > now() - toIntervalMinute(30);