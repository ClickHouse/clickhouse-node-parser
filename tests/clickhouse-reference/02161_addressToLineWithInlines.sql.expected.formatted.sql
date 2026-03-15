-- Tags: no-tsan, no-asan, no-ubsan, no-msan, no-debug, no-fasttest, no-llvm-coverage
SET allow_introspection_functions = 0;

SELECT addressToLineWithInlines(1); -- { serverError FUNCTION_NOT_ALLOWED }

SET allow_introspection_functions = 1;

SET query_profiler_real_time_period_ns = 0;

SET query_profiler_cpu_time_period_ns = 1000000;

SET log_queries = 1, max_rows_to_read = 0;

SELECT count()
FROM numbers_mt(10000000000)
SETTINGS log_comment = '02161_test_case';

SET log_queries = 0;

SET query_profiler_cpu_time_period_ns = 0;

SET max_execution_time = 300;