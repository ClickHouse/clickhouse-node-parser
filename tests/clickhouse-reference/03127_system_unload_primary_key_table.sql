SELECT round(primary_key_bytes_in_memory, -7), round(primary_key_bytes_in_memory_allocated, -7) FROM system.parts WHERE database = currentDatabase() AND table IN ('test', 'test2');
SELECT s != '' FROM test LIMIT 1;
SELECT s != '' FROM test WHERE s < '99999999' LIMIT 1;
SELECT s != '' FROM test2 LIMIT 1;
SELECT s != '' FROM test2 WHERE s < '99999999' LIMIT 1;
