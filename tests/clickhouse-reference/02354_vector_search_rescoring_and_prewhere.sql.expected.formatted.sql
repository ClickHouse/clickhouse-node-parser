SELECT
    id,
    attr1,
    attr2,
    vec
FROM tab
ORDER BY L2Distance(vec, [0.2, 0.3]) ASC;

SELECT id
FROM tab
WHERE attr1 > 110
ORDER BY L2Distance(vec, [0.2, 0.3]) ASC
LIMIT 4
SETTINGS
    query_plan_optimize_prewhere = 0,
    optimize_move_to_prewhere = 0;

SELECT id
FROM tab
WHERE attr1 > 110
ORDER BY L2Distance(vec, [0.2, 0.3]) ASC
LIMIT 4
SETTINGS
    query_plan_optimize_prewhere = 1,
    optimize_move_to_prewhere = 1;

SELECT id
FROM tab
WHERE attr1 > 110
ORDER BY L2Distance(vec, [0.2, 0.3]) ASC
LIMIT 4
SETTINGS vector_search_with_rescoring = 1;

SELECT id
FROM tab
WHERE attr1 > 110
ORDER BY L2Distance(vec, [0.2, 0.3]) ASC
LIMIT 4
SETTINGS
    vector_search_with_rescoring = 1,
    vector_search_index_fetch_multiplier = 3;

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN header = 1
        SELECT id
        FROM tab
        PREWHERE attr1 > 110
        ORDER BY L2Distance(vec, [0.2, 0.3]) ASC
        LIMIT 4
    )
WHERE (like(`explain`, '%_distance%'));

SELECT id
FROM tab
PREWHERE attr1 > 110
ORDER BY L2Distance(vec, [0.2, 0.3]) ASC
LIMIT 4;

SELECT
    id,
    attr1,
    attr2
FROM tab
ORDER BY L2Distance(vec, [0.2, 0.3]) ASC
LIMIT 20;

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN header = 1
        SELECT
            id,
            attr1,
            attr2,
            L2Distance(vec, [0.2, 0.3])
        FROM tab
        ORDER BY L2Distance(vec, [0.2, 0.3]) ASC
        LIMIT 20
    )
WHERE (like(`explain`, '%_distance%'));

SELECT id
FROM tab
WHERE attr1 > 110
    AND attr2 > 50
ORDER BY L2Distance(vec, [0.2, 0.3]) ASC
LIMIT 4;