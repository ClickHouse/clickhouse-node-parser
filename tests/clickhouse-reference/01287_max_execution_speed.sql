-- Tags: no-fasttest, no-debug, no-tsan, no-msan, no-asan

SET max_rows_to_read=0;
SET max_bytes_to_read=0;
SET min_execution_speed = 100000000000, timeout_before_checking_execution_speed = 0;
SELECT count() FROM system.numbers; -- { serverError TOO_SLOW }
SET min_execution_speed = 0;
SET min_execution_speed_bytes = 800000000000, timeout_before_checking_execution_speed = 0;
SET min_execution_speed_bytes = 0;
SET max_execution_time = 600;
SET max_execution_speed = 1000000;
SET max_block_size = 100;
CREATE TEMPORARY TABLE times (t DateTime);
SELECT count() FROM numbers(2000000);
SELECT max(t) - min(t) >= 1 FROM times;
SET max_execution_speed = 0;
SET max_execution_speed_bytes = 8000000;
SET max_execution_speed_bytes = 0;
