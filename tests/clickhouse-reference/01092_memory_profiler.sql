SELECT ignore(groupArray(number), 'test memory profiler') FROM numbers(10000000) SETTINGS log_comment = '01092_memory_profiler';
