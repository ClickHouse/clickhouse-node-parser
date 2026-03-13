SELECT '-- No additional WHERE clauses present, expect index usage';

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab
        ORDER BY L2Distance(vec, [1.0, 1.0]) ASC
        LIMIT 2
        SETTINGS vector_search_filter_strategy = 'prefilter'
    )
WHERE like(`explain`, '%vector_similarity%')
    OR like(`explain`, '%Granules: 3/4%');

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab
        WHERE attr2 >= 1006
        ORDER BY L2Distance(vec, [1.0, 1.0]) ASC
        LIMIT 2
        SETTINGS vector_search_filter_strategy = 'prefilter'
    )
WHERE like(`explain`, '%vector_similarity%');

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab
        WHERE attr1 <= 105
        ORDER BY L2Distance(vec, [1.0, 1.0]) ASC
        LIMIT 2
        SETTINGS vector_search_filter_strategy = 'prefilter'
    )
WHERE like(`explain`, '%vector_similarity%');

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab
        WHERE id <= 6
        ORDER BY L2Distance(vec, [1.0, 1.0]) ASC
        LIMIT 2
        SETTINGS vector_search_filter_strategy = 'prefilter'
    )
WHERE like(`explain`, '%vector_similarity%');

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab
        ORDER BY L2Distance(vec, [1.0, 1.0]) ASC
        LIMIT 2
        SETTINGS vector_search_filter_strategy = 'postfilter'
    )
WHERE like(`explain`, '%vector_similarity%')
    OR like(`explain`, '%Granules: 3/4%');

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab
        WHERE date <= '2025-01-02'
        ORDER BY L2Distance(vec, [1.0, 1.0]) ASC
        LIMIT 2
        SETTINGS vector_search_filter_strategy = 'postfilter'
    )
WHERE like(`explain`, '%vector_similarity%');

SELECT trimLeft(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM tab
        WHERE date = '2025-01-03'
            AND attr1 = 110
        ORDER BY L2Distance(vec, [1.0, 1.0]) ASC
        LIMIT 2
        SETTINGS vector_search_filter_strategy = 'postfilter'
    )
WHERE like(`explain`, '%vector_similarity%');

SELECT id
FROM tab
WHERE date = '2025-01-03'
    AND id <= 9
ORDER BY L2Distance(vec, [1.0, 1.0]) ASC
LIMIT 2
SETTINGS
    log_comment = '02354_vector_search_post_filter_strategy_query1',
    vector_search_with_rescoring = 1;

SELECT DISTINCT ProfileEvents['USearchSearchCount']
FROM `system`.query_log
WHERE log_comment = '02354_vector_search_post_filter_strategy_query1'
    AND current_database = currentDatabase()
    AND type = 'QueryFinish';

SELECT id
FROM tab
WHERE date = '2025-01-03'
    AND attr2 >= 1008
ORDER BY L2Distance(vec, [1.0, 1.0]) ASC
LIMIT 3;

SELECT id
FROM tab
WHERE date = '2025-01-03'
    AND attr2 >= 1008
ORDER BY L2Distance(vec, [1.0, 1.0]) ASC
LIMIT 3
SETTINGS vector_search_index_fetch_multiplier = 2.0;

SELECT id
FROM tab
WHERE date = '2025-01-03'
    AND attr2 >= 1008
ORDER BY L2Distance(vec, [1.0, 1.0]) ASC
LIMIT 3
SETTINGS vector_search_index_fetch_multiplier = -1.0; -- { serverError INVALID_SETTING_VALUE }

SELECT id
FROM tab
WHERE date = '2025-01-03'
    AND attr2 >= 1008
ORDER BY L2Distance(vec, [1.0, 1.0]) ASC
LIMIT 3
SETTINGS vector_search_index_fetch_multiplier = 0.0; -- { serverError INVALID_SETTING_VALUE }

SELECT id
FROM tab
WHERE date = '2025-01-03'
    AND attr2 >= 1008
ORDER BY L2Distance(vec, [1.0, 1.0]) ASC
LIMIT 3
SETTINGS vector_search_index_fetch_multiplier = 1001.0; -- { serverError INVALID_SETTING_VALUE }