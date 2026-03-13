-- Expecting 2 virtual rows + one chunk (8192) for result + one extra chunk for next consumption in merge transform (8192),
-- both chunks come from the same part.
SELECT x
FROM t
ORDER BY x ASC
LIMIT 4
SETTINGS
    max_block_size = 8192,
    read_in_order_two_level_merge_threshold = 0,
    max_threads = 1,
    optimize_read_in_order = 1,
    log_comment = 'preliminary merge, no filter';

SELECT read_rows
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND log_comment = 'preliminary merge, no filter'
    AND type = 'QueryFinish'
ORDER BY query_start_time DESC
LIMIT 1;

-- Expecting 2 virtual rows + two chunks (8192*2) get filtered out + one chunk for result (8192),
-- all chunks come from the same part.
SELECT k
FROM t
WHERE k > 8192 * 2
ORDER BY x ASC
LIMIT 4
SETTINGS
    max_block_size = 8192,
    read_in_order_two_level_merge_threshold = 0,
    max_threads = 1,
    optimize_read_in_order = 1,
    log_comment = 'preliminary merge with filter';

SELECT read_rows
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND log_comment = 'preliminary merge with filter'
    AND type = 'QueryFinish'
ORDER BY query_start_time DESC
LIMIT 1;

-- Expecting 2 virtual rows + one chunk (8192) for result + one extra chunk for next consumption in merge transform (8192),
-- both chunks come from the same part.
SELECT x
FROM t
ORDER BY x ASC
LIMIT 4
SETTINGS
    max_block_size = 8192,
    read_in_order_two_level_merge_threshold = 5,
    max_threads = 1,
    optimize_read_in_order = 1,
    log_comment = 'no preliminary merge, no filter';

SELECT read_rows
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND log_comment = 'no preliminary merge, no filter'
    AND type = 'QueryFinish'
ORDER BY query_start_time DESC
LIMIT 1;

-- Expecting 2 virtual rows + two chunks (8192*2) get filtered out + one chunk for result (8192),
-- all chunks come from the same part.
SELECT k
FROM t
WHERE k > 8192 * 2
ORDER BY x ASC
LIMIT 4
SETTINGS
    max_block_size = 8192,
    read_in_order_two_level_merge_threshold = 5,
    max_threads = 1,
    optimize_read_in_order = 1,
    log_comment = 'no preliminary merge, with filter';

SELECT read_rows
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND log_comment = 'no preliminary merge, with filter'
    AND type = 'QueryFinish'
ORDER BY query_start_time DESC
LIMIT 1;

SELECT
    a,
    b
FROM fixed_prefix
WHERE a = 1
ORDER BY b ASC
SETTINGS
    max_threads = 1,
    optimize_read_in_order = 1,
    read_in_order_two_level_merge_threshold = 0; --force preliminary merge

SELECT
    a,
    b
FROM fixed_prefix
WHERE a = 1
ORDER BY b ASC
SETTINGS
    max_threads = 1,
    optimize_read_in_order = 1,
    read_in_order_two_level_merge_threshold = 5; --avoid preliminary merge

SELECT *
FROM function_pk
ORDER BY (A,-B) ASC
LIMIT 3
SETTINGS
    max_threads = 1,
    optimize_read_in_order = 1,
    read_in_order_two_level_merge_threshold = 5; --avoid preliminary merge

-- modified from 02317_distinct_in_order_optimization
SELECT '-- test distinct ----';

SELECT DISTINCT a
FROM distinct_in_order
ORDER BY a ASC
SETTINGS
    read_in_order_two_level_merge_threshold = 0,
    optimize_read_in_order = 1,
    max_threads = 2;