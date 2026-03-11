SELECT trimLeft(explain) AS explain FROM (
    EXPLAIN indexes=1 WITH [0.0, 2.0] AS reference_vec SELECT id FROM tab ORDER BY L2Distance(vec1, reference_vec) LIMIT 3
)
WHERE explain ILIKE '%Skip%' OR explain ILIKE '%Name: idx%' OR explain ILIKE '%vector_similarity%';
SELECT trimLeft(explain) AS explain FROM (
    EXPLAIN indexes=1 WITH [0.0, 2.0] AS reference_vec SELECT id FROM tab ORDER BY L2Distance(vec2, reference_vec) LIMIT 3
)
WHERE explain ILIKE '%Skip%' OR explain ILIKE '%Name: idx%' OR explain ILIKE '%vector_similarity%';
