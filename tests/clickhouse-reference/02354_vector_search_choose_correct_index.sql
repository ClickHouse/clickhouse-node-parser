-- Tags: no-fasttest, no-ordinary-database

SET parallel_replicas_local_plan = 1; -- this setting is randomized, set it explicitly to have local plan for parallel replicas
CREATE TABLE tab(id Int32, vec1 Array(Float32), vec2 Array(Float32), INDEX idx vec1 TYPE vector_similarity('hnsw', 'L2Distance', 2)) ENGINE = MergeTree ORDER BY id;
SELECT trimLeft(explain) AS explain FROM (
    EXPLAIN indexes=1 WITH [0.0, 2.0] AS reference_vec SELECT id FROM tab ORDER BY L2Distance(vec1, reference_vec) LIMIT 3
)
WHERE explain ILIKE '%Skip%' OR explain ILIKE '%Name: idx%' OR explain ILIKE '%vector_similarity%';
SELECT trimLeft(explain) AS explain FROM (
    EXPLAIN indexes=1 WITH [0.0, 2.0] AS reference_vec SELECT id FROM tab ORDER BY L2Distance(vec2, reference_vec) LIMIT 3
)
WHERE explain ILIKE '%Skip%' OR explain ILIKE '%Name: idx%' OR explain ILIKE '%vector_similarity%';
