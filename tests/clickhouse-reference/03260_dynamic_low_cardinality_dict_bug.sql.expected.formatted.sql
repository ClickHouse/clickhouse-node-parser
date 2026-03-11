SELECT d.`LowCardinality(String)`
FROM test
SETTINGS max_threads = 1;