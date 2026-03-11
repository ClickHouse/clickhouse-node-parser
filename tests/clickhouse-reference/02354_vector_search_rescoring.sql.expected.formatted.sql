SELECT '-- Expect column "_distance" in EXPLAIN. Column "vec" is not expected for ReadFromMergeTree.';

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN header = 1
        WITH [0.0, 2.0] AS reference_vec

        SELECT id
        FROM tab
        ORDER BY L2Distance(vec, reference_vec) ASC
        LIMIT 3
        SETTINGS vector_search_with_rescoring = 0
    )
WHERE ((like(`explain`, '%_distance%')
    OR like(`explain`, '%vec%Array%')))
    AND notLike(`explain`, '%L2Distance%');

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN header = 1
        WITH [0.0, 2.0] AS reference_vec

        SELECT id
        FROM tab
        ORDER BY L2Distance(vec, reference_vec) ASC
        LIMIT 3
        SETTINGS vector_search_with_rescoring = 1
    )
WHERE (like(`explain`, '%_distance%'));

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN header = 1
        WITH [0.0, 2.0] AS reference_vec

        SELECT
            id,
            vec
        FROM tab
        ORDER BY L2Distance(vec, reference_vec) ASC
        LIMIT 3
        SETTINGS vector_search_with_rescoring = 0
    )
WHERE (like(`explain`, '%_distance%'));

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN header = 1
        WITH [0.0, 2.0] AS reference_vec

        SELECT
            id,
            vec
        FROM tab
        ORDER BY L2Distance(vec, reference_vec) ASC
        LIMIT 3
        SETTINGS vector_search_with_rescoring = 1
    )
WHERE (like(`explain`, '%_distance%'));

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN header = 1
        WITH [0.0, 2.0] AS reference_vec

        SELECT id
        FROM tab
        WHERE id >= 0
        ORDER BY L2Distance(vec, reference_vec) ASC
        LIMIT 5
        SETTINGS vector_search_with_rescoring = 0
    )
WHERE ((like(`explain`, '%_distance%')
    OR like(`explain`, '%vec%Array%')))
    AND notLike(`explain`, '%L2Distance%');