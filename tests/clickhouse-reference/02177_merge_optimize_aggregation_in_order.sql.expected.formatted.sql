-- regression for optimize_aggregation_in_order
-- that cause "Chunk should have AggregatedChunkInfo in GroupingAggregatedTransform" error
SELECT count()
FROM remote('127.{1,2}', currentDatabase(), data_02177)
GROUP BY key;

SELECT count()
FROM remote('127.{1,2}', currentDatabase(), data_02177)
GROUP BY key
SETTINGS distributed_aggregation_memory_efficient = 0;