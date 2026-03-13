SELECT '-- INSERT 20 rows using the reinterpret() technique';

SELECT id
FROM dbpedia
ORDER BY cosineDistance(vec, (
        SELECT vec
        FROM dbpedia
        WHERE id = '<dbpedia:Honda>'
    )) ASC
LIMIT 4
SETTINGS use_skip_indexes = 0;

SELECT id
FROM dbpedia
ORDER BY cosineDistance(vec, (
        SELECT vec
        FROM dbpedia
        WHERE id = '<dbpedia:Honda>'
    )) ASC
LIMIT 4;

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM dbpedia
        ORDER BY cosineDistance(vec, (
                SELECT vec
                FROM dbpedia
                WHERE id = '<dbpedia:Honda>'
            )) ASC
        LIMIT 4
    )
WHERE like(`explain`, '%vector_similarity%');

SELECT id
FROM dbpedia
ORDER BY cosineDistance(vec, (
        SELECT vec
        FROM dbpedia
        WHERE id = '<dbpedia:Pizza>'
    )) ASC
LIMIT 4;

SELECT id
FROM dbpedia
ORDER BY cosineDistance(vec, (
        SELECT vec
        FROM dbpedia
        WHERE id = '<dbpedia:Database_theory>'
    )) ASC
LIMIT 4;

-- Check that an index with binary quantization (1 bit / dimension) is smaller than an index with BFloat16 (2 bytes / dimension)
SELECT if(data_uncompressed_bytes < (20 * 1536 * 2), 'Good', toString(data_uncompressed_bytes))
FROM `system`.data_skipping_indices
WHERE database = currentDatabase()
    AND name = 'vec_idx';

-- Expect 1.
SELECT id
FROM tab
ORDER BY cosineDistance(vec, [-0.25, 0.25, 0.10, 0.10, 0.9, 0.9, 0.9, 0.9]) ASC
LIMIT 1
SETTINGS vector_search_with_rescoring = 0;

-- Expect 2
SELECT id
FROM tab
ORDER BY cosineDistance(vec, [-0.25, 0.25, 0.10, 0.10, 0.9, 0.9, 0.9, 0.9]) ASC
LIMIT 1
SETTINGS
    vector_search_with_rescoring = 1,
    vector_search_index_fetch_multiplier = 4;