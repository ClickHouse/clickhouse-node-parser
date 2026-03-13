SELECT columns_descriptions_cache_size
FROM `system`.tables
WHERE database = currentDatabase()
    AND table = 't_mem';

SELECT columns_descriptions_cache_size
FROM `system`.tables
WHERE database = currentDatabase()
    AND table = 't_mt';

-- system.metrics
SELECT value > 0
FROM `system`.metrics
WHERE metric = 'ColumnsDescriptionsCacheSize';