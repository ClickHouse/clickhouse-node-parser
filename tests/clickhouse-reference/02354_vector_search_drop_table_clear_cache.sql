-- Tags: no-fasttest, no-ordinary-database, no-parallel, no-parallel-replicas
-- no-parallel: Vector index cache should not be touched by another test
-- no-parallel-replicas: EXPLAIN plan stability

-- Verify that vector similarity index cache is cleared when table with vector index is dropped.

SET enable_analyzer = 1;
SET parallel_replicas_local_plan = 1; -- this setting is randomized, set it explicitly to force local plan for parallel replicas
CREATE TABLE tab(id Int32, vec Array(Float32), INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 2)) ENGINE = MergeTree ORDER BY id SETTINGS index_granularity = 8192;
INSERT INTO tab VALUES (0, [1.0, 0.0]), (1, [1.1, 0.0]), (2, [1.2, 0.0]), (3, [1.3, 0.0]), (4, [1.4, 0.0]), (5, [0.0, 2.0]), (6, [0.0, 2.1]), (7, [0.0, 2.2]), (8, [0.0, 2.3]), (9, [0.0, 2.4]);
-- Make sure vector index cache is utilized.
SELECT name, IF(value > 0, 'Good', 'Zero') FROM system.metrics where name like '%VectorSimilarityIndexCacheBytes%';
-- Should be 0
SELECT name, value FROM system.metrics where name like '%VectorSimilarityIndexCacheBytes%';
