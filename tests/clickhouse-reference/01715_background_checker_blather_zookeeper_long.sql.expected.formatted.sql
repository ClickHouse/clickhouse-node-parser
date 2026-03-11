SELECT number
FROM numbers(10)
WHERE sleepEachRow(1)
FORMAT Null;

SELECT num_tries < 200
FROM `system`.replication_queue
WHERE table = 'i20203_2'
    AND database = currentDatabase();