SELECT secondary_indices_compressed_bytes > 0
FROM system.parts
WHERE database = currentDatabase() AND table = 'tab' AND active
ORDER BY name;
SELECT count() FROM tab WHERE text LIKE '%v322%';
SELECT trim(explain) FROM
(
    EXPLAIN actions = 1 SELECT count() FROM tab WHERE text LIKE '%v322%'
)
WHERE explain ILIKE '%filter column%';
SELECT trim(explain) FROM
(
    EXPLAIN indexes = 1 SELECT count() FROM tab WHERE text LIKE '%v322%'
)
WHERE explain ILIKE '%Granules%';
