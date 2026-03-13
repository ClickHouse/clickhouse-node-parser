-- Make sure vector index cache is utilized.
SELECT
    name,
    IF(value > 0, 'Good', 'Zero')
FROM `system`.metrics
WHERE like(name, '%VectorSimilarityIndexCacheBytes%');

-- Should be 0
SELECT
    name,
    value
FROM `system`.metrics
WHERE like(name, '%VectorSimilarityIndexCacheBytes%');