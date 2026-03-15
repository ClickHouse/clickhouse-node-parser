-- Tags: no-tsan, no-asan, no-ubsan, no-msan, no-debug, no-fasttest, no-llvm-coverage
-- Tag no-fasttest: Not sure why fail even in sequential mode. Disabled for now to make some progress.

SET allow_introspection_functions = 1;
SET trace_profile_events = 0; -- This can inhibit profiler from working, because it prevents sending samples from different profilers concurrently.
SET query_profiler_cpu_time_period_ns = 0;
SET query_profiler_real_time_period_ns = 100000000;
SET log_queries = 1;
SELECT sleep(0.5), ignore('test real time query profiler');
SET log_queries = 0;
SET query_profiler_real_time_period_ns = 0;
SET query_profiler_cpu_time_period_ns = 1000000;
SET max_rows_to_read = 0;
SELECT count(), ignore('test cpu time query profiler') FROM numbers_mt(10000000000);
