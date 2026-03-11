SELECT * FROM test;
SELECT * FROM test2;
SELECT min_block_number, max_block_number, partition, partition_id FROM system.parts WHERE database = currentDatabase() AND table = 'test' AND active ORDER BY partition;
SELECT min_block_number, max_block_number, partition, partition_id FROM system.parts WHERE database = currentDatabase() AND table = 'test2' AND active ORDER BY partition;
SELECT * FROM test ORDER BY x;
SELECT * FROM test2 ORDER BY x;
