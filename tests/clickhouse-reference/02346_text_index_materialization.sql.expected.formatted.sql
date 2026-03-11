SELECT secondary_indices_compressed_bytes > 0
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'tab'
    AND active
ORDER BY name ASC;

SELECT count()
FROM tab
WHERE like(text, '%v322%');

SELECT trim(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM tab
        WHERE like(text, '%v322%')
    )
WHERE ilike(`explain`, '%filter column%');

SELECT trim(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT count()
        FROM tab
        WHERE like(text, '%v322%')
    )
WHERE ilike(`explain`, '%Granules%');