SELECT id, attr1, attr2, vec
FROM tab
ORDER BY L2Distance(vec, [0.2, 0.3]);
-- Expect IDs 16 & 19 for next 2 queries

SELECT id
FROM tab
WHERE attr1 > 110
ORDER BY L2Distance(vec, [0.2, 0.3])
LIMIT 4
SETTINGS query_plan_optimize_prewhere = 0,
         optimize_move_to_prewhere = 0;
SELECT id
FROM tab
WHERE attr1 > 110
ORDER BY L2Distance(vec, [0.2, 0.3])
LIMIT 4
SETTINGS query_plan_optimize_prewhere = 1,
         optimize_move_to_prewhere = 1;
-- Expect 16 & 19, and additionally 18 and 17 because they are in the same granules

SELECT id
FROM tab
WHERE attr1 > 110
ORDER BY L2Distance(vec, [0.2, 0.3])
LIMIT 4
SETTINGS vector_search_with_rescoring = 1;
SELECT id
FROM tab
WHERE attr1 > 110
ORDER BY L2Distance(vec, [0.2, 0.3])
LIMIT 4
SETTINGS vector_search_with_rescoring = 1,
         vector_search_index_fetch_multiplier = 3;
-- Expect no _distance column in result
SELECT trimLeft(explain) AS explain FROM (
    EXPLAIN header = 1
    SELECT id
    FROM tab
    PREWHERE attr1 > 110
    ORDER BY L2Distance(vec, [0.2, 0.3])
    LIMIT 4
    )
WHERE (explain LIKE '%_distance%');
SELECT id
FROM tab
PREWHERE attr1 > 110
ORDER BY L2Distance(vec, [0.2, 0.3])
LIMIT 4;
SELECT id, attr1, attr2
FROM tab
ORDER BY L2Distance(vec, [0.2, 0.3])
LIMIT 20;
SELECT trimLeft(explain) AS explain FROM (
    EXPLAIN header = 1
    SELECT id, attr1, attr2, L2Distance(vec, [0.2, 0.3]),
    FROM tab
    ORDER BY L2Distance(vec, [0.2, 0.3])
    LIMIT 20
    )
WHERE (explain LIKE '%_distance%');
SELECT id
FROM tab
WHERE attr1 > 110 AND attr2 > 50
ORDER BY L2Distance(vec, [0.2, 0.3])
LIMIT 4;
