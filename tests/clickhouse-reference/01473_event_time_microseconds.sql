-- Tags: no-tsan, no-asan, no-ubsan, no-msan, no-debug

-- This file contains tests for the event_time_microseconds field for various tables.
-- Note: Only event_time_microseconds for asynchronous_metric_log table is tested via
-- an integration test as those metrics take 60s by default to be updated.
-- Refer: tests/integration/test_asynchronous_metric_log_table.

SET log_queries = 1;
SET log_query_threads = 1;
SET query_profiler_real_time_period_ns = 100000000;
-- a long enough query to trigger the query profiler and to record trace log
SELECT sleep(2) FORMAT Null;
SET query_profiler_real_time_period_ns = 1000000000;
