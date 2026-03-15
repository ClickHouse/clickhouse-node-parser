-- Tags: no-fasttest, no-ordinary-database, no-parallel-replicas
-- no-parallel-replicas: If parallel replicas are on, the optimization (no rescoring) may not work.
-- Test for setting 'vector_search_with_rescoring'
SET enable_analyzer = 1;

SET parallel_replicas_local_plan = 1; -- this setting is randomized, set it explicitly to force local plan for parallel replicas

CREATE TABLE tab
(
    id Int32,
    vec Array(Float32),
    attr1 Int32,
    INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 2)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 2;

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