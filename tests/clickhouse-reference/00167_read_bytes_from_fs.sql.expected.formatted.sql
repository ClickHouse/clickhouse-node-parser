SELECT sum(cityHash64(*))
FROM test.hits
SETTINGS max_threads = 40;

SELECT ProfileEvents['ReadBufferFromFileDescriptorReadBytes'] < 1500000000
FROM `system`.query_log
WHERE query = 'SELECT sum(cityHash64(*)) FROM test.hits SETTINGS max_threads=40;'
    AND current_database = currentDatabase()
    AND type = 'QueryFinish';