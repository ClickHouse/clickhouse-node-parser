-- Tags: no-tsan, no-asan, no-ubsan, no-msan, no-debug, no-parallel, no-fasttest
SET allow_introspection_functions = 1;

SET memory_profiler_step = 1000000;

SET memory_profiler_sample_probability = 1;

SET log_queries = 1;

SELECT ignore(groupArray(number), 'test memory profiler')
FROM numbers(10000000)
SETTINGS log_comment = '01092_memory_profiler';