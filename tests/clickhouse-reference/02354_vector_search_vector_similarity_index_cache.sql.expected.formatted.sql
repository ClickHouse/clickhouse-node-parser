SELECT
    metric,
    value
FROM `system`.metrics
WHERE metric = 'VectorSimilarityIndexCacheBytes';

SELECT
    ProfileEvents['VectorSimilarityIndexCacheHits'],
    ProfileEvents['VectorSimilarityIndexCacheMisses']
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND like(query, '%ORDER BY L2Distance%')
ORDER BY event_time_microseconds ASC;