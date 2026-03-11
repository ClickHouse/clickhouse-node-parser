SELECT '-- Plan must contain vector index usage';
SELECT trimLeft(explain) AS explain FROM (
    EXPLAIN indexes = 1
    SELECT id
    FROM tab
    ORDER BY L2Distance(vec, arrayWithConstant(32768, 0.2))
    LIMIT 3
)
WHERE explain ILIKE '%Skip%' OR explain ILIKE '%Name: idx%' OR explain ILIKE '%vector_similarity%';
-- Nearest vectors to [0.9,0.9...,0.9] are [0.9,...], [0.8,...], [0.7,...]
SELECT id
FROM tab
ORDER BY L2Distance(vec, arrayWithConstant(32768, 0.9))
LIMIT 3;
