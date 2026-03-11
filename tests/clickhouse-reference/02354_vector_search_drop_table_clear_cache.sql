-- Make sure vector index cache is utilized.
SELECT name, IF(value > 0, 'Good', 'Zero') FROM system.metrics where name like '%VectorSimilarityIndexCacheBytes%';
-- Should be 0
SELECT name, value FROM system.metrics where name like '%VectorSimilarityIndexCacheBytes%';
