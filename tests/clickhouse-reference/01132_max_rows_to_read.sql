SELECT count() FROM numbers(30); -- { serverError TOO_MANY_ROWS }
SELECT count() FROM numbers(19);
SELECT count() FROM numbers(20);
SELECT count() FROM numbers(21); -- { serverError TOO_MANY_ROWS }
-- check early exception if the estimated number of rows is high
SELECT * FROM numbers(30); -- { serverError TOO_MANY_ROWS }
SELECT count() FROM numbers(29);
SELECT count() FROM numbers(31);
-- Should fail fast during PK filtering - query selects more rows than limit
SELECT count() FROM row_limits_fail_fast WHERE key < 500000; -- { serverError TOO_MANY_ROWS }
SELECT count() FROM row_limits_fail_fast WHERE key < 500;
-- Test with specific key ranges
SELECT count() FROM row_limits_fail_fast WHERE key BETWEEN 1000 AND 1500;
SELECT * FROM row_limits_fail_fast WHERE key < 200 FORMAT Null; -- { serverError TOO_MANY_ROWS }
SELECT count() FROM row_limits_fail_fast WHERE key IN (1, 2, 3, 4, 5);
SELECT count() FROM row_limits_fail_fast WHERE key < 100000; -- { serverError TOO_MANY_ROWS }
-- But should succeed when actual filtered result is small
SELECT count() FROM row_limits_fail_fast WHERE key < 400;
