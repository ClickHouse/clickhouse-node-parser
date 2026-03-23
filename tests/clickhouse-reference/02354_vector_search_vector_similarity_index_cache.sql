-- Tags: no-parallel, no-fasttest, no-ordinary-database
-- no-parallel: looks at server-wide metrics

-- Tests the vector index cache.

SET parallel_replicas_local_plan = 1;
SELECT metric, value FROM system.metrics WHERE metric = 'VectorSimilarityIndexCacheBytes';
CREATE TABLE tab(id Int32, vec Array(Float32), INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 2)) ENGINE = MergeTree ORDER BY id;
INSERT INTO tab VALUES (0, [1.0, 0.0]), (1, [1.1, 0.0]), (2, [1.2, 0.0]), (3, [1.3, 0.0]), (4, [1.4, 0.0]), (5, [1.5, 0.0]), (6, [0.0, 2.0]), (7, [0.0, 2.1]), (8, [0.0, 2.2]), (9, [0.0, 2.3]), (10, [0.0, 2.4]), (11, [0.0, 2.5]);
SELECT ProfileEvents['VectorSimilarityIndexCacheHits'], ProfileEvents['VectorSimilarityIndexCacheMisses']
FROM system.query_log
WHERE event_date >= yesterday() AND current_database = currentDatabase() AND type = 'QueryFinish' AND query LIKE '%ORDER BY L2Distance%'
ORDER BY event_time_microseconds;
