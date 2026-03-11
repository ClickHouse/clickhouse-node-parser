SELECT *
FROM test
ORDER BY x ASC;

SELECT *
FROM test
ORDER BY x.a ASC;

SELECT *
FROM test
ORDER BY x.b ASC;

SELECT *
FROM test
WHERE x.a = 2;

SELECT *
FROM test
WHERE x.b = 'World'
SETTINGS
    max_rows_to_read = 1,
    parallel_replicas_index_analysis_only_on_coordinator = 0;

SELECT x.a
FROM test
ORDER BY x ASC;

SELECT x.a
FROM test
ORDER BY x.a ASC;

SELECT x.a
FROM test
ORDER BY x.b ASC;

SELECT x.a
FROM test
WHERE x.a = 2;

SELECT x.a
FROM test
WHERE x.b = 'World'
SETTINGS
    max_rows_to_read = 1,
    parallel_replicas_index_analysis_only_on_coordinator = 0;

SELECT x.b
FROM test
ORDER BY x ASC;

SELECT x.b
FROM test
ORDER BY x.a ASC;

SELECT x.b
FROM test
ORDER BY x.b ASC;

SELECT x.b
FROM test
WHERE x.a = 2;

SELECT x.b
FROM test
WHERE x.b = 'World'
SETTINGS
    max_rows_to_read = 1,
    parallel_replicas_index_analysis_only_on_coordinator = 0;