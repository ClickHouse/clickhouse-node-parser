-- Tags: no-fasttest, no-ordinary-database, no-parallel, no-parallel-replicas
-- no-parallel: Vector index cache should not be touched by another test
-- no-parallel-replicas: EXPLAIN plan stability
-- Verify that vector similarity index cache is cleared when table with vector index is dropped.
SET enable_analyzer = 1;

SET parallel_replicas_local_plan = 1; -- this setting is randomized, set it explicitly to force local plan for parallel replicas

DROP TABLE IF EXISTS tab;

CREATE TABLE tab
(
    id Int32,
    vec Array(Float32),
    INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 2)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192;

INSERT INTO tab;

-- Make sure vector index cache is utilized.
SELECT
    name,
    IF(value > 0, 'Good', 'Zero')
FROM `system`.metrics
WHERE like(name, '%VectorSimilarityIndexCacheBytes%');

-- SYNC is important to drop the table/parts/caches immediately
DROP TABLE tab;

-- Should be 0
SELECT
    name,
    value
FROM `system`.metrics
WHERE like(name, '%VectorSimilarityIndexCacheBytes%');