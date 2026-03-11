SELECT *
FROM read_in_order_with_parallel_replicas
ORDER BY id DESC
LIMIT 1;

SELECT *
FROM read_in_order_with_parallel_replicas
ORDER BY id ASC
LIMIT 1;

SELECT *
FROM read_in_order_with_parallel_replicas
ORDER BY id DESC
LIMIT 1
SETTINGS
    max_threads = 1,
    log_comment = 'test read in order desc with parallel replicas';

SELECT *
FROM read_in_order_with_parallel_replicas
ORDER BY id ASC
LIMIT 1
SETTINGS
    max_threads = 1,
    log_comment = 'test read in order asc with parallel replicas';

SELECT count(1)
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND log_comment = 'test read in order desc with parallel replicas'
    AND read_rows > 2;

SELECT count(1)
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND log_comment = 'test read in order asc with parallel replicas'
    AND read_rows > 2;