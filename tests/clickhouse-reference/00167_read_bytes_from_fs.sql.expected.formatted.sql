-- Tags: stateful, no-random-settings, no-parallel
-- no-parallel: Heavy query
SET max_memory_usage = '10G';

SELECT sum(cityHash64(*))
FROM test.hits
SETTINGS max_threads = 40;

SELECT ProfileEvents['ReadBufferFromFileDescriptorReadBytes'] < 1500000000
FROM `system`.query_log
WHERE query = 'SELECT sum(cityHash64(*)) FROM test.hits SETTINGS max_threads=40;'
    AND current_database = currentDatabase()
    AND type = 'QueryFinish';