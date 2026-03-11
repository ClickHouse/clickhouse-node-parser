SELECT *
FROM test_table
SETTINGS
    max_threads = 1025,
    max_streams_to_max_threads_ratio = -9223372036854775808,
    enable_analyzer = 1;

SELECT *
FROM test_table
SETTINGS
    max_threads = 1025,
    max_streams_to_max_threads_ratio = -9223372036854775808,
    enable_analyzer = 0;