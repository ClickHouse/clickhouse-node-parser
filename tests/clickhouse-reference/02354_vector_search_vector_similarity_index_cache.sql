-- Tags: no-parallel, no-fasttest, no-ordinary-database
-- no-parallel: looks at server-wide metrics

-- Tests the vector index cache.

SET parallel_replicas_local_plan = 1;
SELECT metric, value FROM system.metrics WHERE metric = 'VectorSimilarityIndexCacheBytes';
CREATE TABLE tab(id Int32, vec Array(Float32), INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 2)) ENGINE = MergeTree ORDER BY id;
SELECT ProfileEvents['VectorSimilarityIndexCacheHits'], ProfileEvents['VectorSimilarityIndexCacheMisses']
FROM system.query_log
WHERE event_date >= yesterday() AND current_database = currentDatabase() AND type = 'QueryFinish' AND query LIKE '%ORDER BY L2Distance%'
ORDER BY event_time_microseconds;
