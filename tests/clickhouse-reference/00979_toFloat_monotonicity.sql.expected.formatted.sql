SELECT n
FROM test1
WHERE toFloat64(n) = 7777.0
SETTINGS
    max_rows_to_read = 2,
    parallel_replicas_index_analysis_only_on_coordinator = 0;

SELECT n
FROM test1
WHERE toFloat32(n) = 7777.0
SETTINGS
    max_rows_to_read = 2,
    parallel_replicas_index_analysis_only_on_coordinator = 0;

SELECT s
FROM test2
WHERE toFloat64(s) = 7777.0;

SELECT s
FROM test2
WHERE toFloat32(s) = 7777.0;

SELECT d
FROM test3
WHERE toFloat64(d) = 7777.0
SETTINGS
    max_rows_to_read = 2,
    parallel_replicas_index_analysis_only_on_coordinator = 0;

SELECT d
FROM test3
WHERE toFloat32(d) = 7777.0
SETTINGS
    max_rows_to_read = 2,
    parallel_replicas_index_analysis_only_on_coordinator = 0;