SELECT number from numbers(10) where sleepEachRow(1) Format Null;
SELECT num_tries < 200
FROM system.replication_queue
WHERE table = 'i20203_2' AND database = currentDatabase();
