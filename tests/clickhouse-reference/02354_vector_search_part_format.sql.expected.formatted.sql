SELECT
    table,
    part_type
FROM `system`.parts
WHERE database = currentDatabase()
    AND like(table, 'tab_%')
ORDER BY table ASC;

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        WITH [0.0, 2.0] AS reference_vec

        SELECT id
        FROM tab_compact_full
        ORDER BY L2Distance(vec, reference_vec) ASC
        LIMIT 3
    )
WHERE like(`explain`, '%vector_similarity%')
    OR like(`explain`, '%Granules:%');

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        WITH [0.0, 2.0] AS reference_vec

        SELECT id
        FROM tab_wide_full
        ORDER BY L2Distance(vec, reference_vec) ASC
        LIMIT 3
    )
WHERE like(`explain`, '%vector_similarity%')
    OR like(`explain`, '%Granules:%');