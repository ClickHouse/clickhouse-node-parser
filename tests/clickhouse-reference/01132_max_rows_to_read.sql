SET max_block_size = 10;
SET max_rows_to_read = 20;
SET read_overflow_mode = 'throw';
SELECT count() FROM numbers(30); -- { serverError TOO_MANY_ROWS }
SELECT count() FROM numbers(19);
SELECT count() FROM numbers(20);
SELECT count() FROM numbers(21); -- { serverError TOO_MANY_ROWS }
-- check early exception if the estimated number of rows is high
SELECT * FROM numbers(30); -- { serverError TOO_MANY_ROWS }
SET read_overflow_mode = 'break';
SELECT count() FROM numbers(29);
SELECT count() FROM numbers(31);
-- the same for uneven block sizes
SET max_block_size = 11;
SET max_block_size = 9;
CREATE TABLE row_limits_fail_fast
(
    key UInt64,
    value String
) ENGINE = MergeTree() ORDER BY key
SETTINGS index_granularity = 100;
SET max_rows_to_read = 0; -- so we don't hit row limits when populating data
SET max_rows_to_read = 1000;
-- Should fail fast during PK filtering - query selects more rows than limit
SELECT count() FROM row_limits_fail_fast WHERE key < 500000; -- { serverError TOO_MANY_ROWS }
SELECT count() FROM row_limits_fail_fast WHERE key < 500;
-- Test with specific key ranges
SELECT count() FROM row_limits_fail_fast WHERE key BETWEEN 1000 AND 1500;
-- Test explicit scan to verify fail-fast during data reading
SET max_rows_to_read = 100;
SELECT * FROM row_limits_fail_fast WHERE key < 200 FORMAT Null; -- { serverError TOO_MANY_ROWS }
-- Test with selective filter - needs at least 1 granule
SET max_rows_to_read = 150;
SELECT count() FROM row_limits_fail_fast WHERE key IN (1, 2, 3, 4, 5);
SET max_rows_to_read_leaf = 1000;
SET read_overflow_mode_leaf = 'throw';
-- Reset and test break mode still works and we fail fast
SET max_rows_to_read = 600;
SET max_rows_to_read_leaf = 0;
-- Test fail-fast with multiple threads
SET max_threads = 4;
SET max_rows_to_read = 500;
SELECT count() FROM row_limits_fail_fast WHERE key < 100000; -- { serverError TOO_MANY_ROWS }
-- But should succeed when actual filtered result is small
SELECT count() FROM row_limits_fail_fast WHERE key < 400;
