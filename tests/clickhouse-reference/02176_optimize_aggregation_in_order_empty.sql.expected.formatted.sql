SELECT count()
FROM remote('127.{1,2}', currentDatabase(), data_02176)
WHERE key = 0
GROUP BY key;

SELECT count()
FROM remote('127.{1,2}', currentDatabase(), data_02176)
WHERE key = 0
GROUP BY key
SETTINGS distributed_aggregation_memory_efficient = 0;