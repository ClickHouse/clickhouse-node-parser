SELECT
    name,
    IF(value > 0, 'Good', 'Zero')
FROM `system`.metrics
WHERE like(name, '%VectorSimilarityIndexCacheBytes%');

SELECT
    name,
    value
FROM `system`.metrics
WHERE like(name, '%VectorSimilarityIndexCacheBytes%');