-- Tags: no-parallel
-- Tag no-parallel: Messes with internal cache
-- Tests that the query condition cache rejects queries with FINAL keyword
SET allow_experimental_analyzer = 1;

CREATE TABLE tab
(
    a Int64,
    b Int64
)
ENGINE = ReplacingMergeTree
ORDER BY a;

SELECT '--- with move to PREWHERE';

SET optimize_move_to_prewhere = true;

SELECT count(*)
FROM tab FINAL
WHERE b = 10000
SETTINGS use_query_condition_cache = true
FORMAT Null;

SELECT count(*)
FROM `system`.query_condition_cache;

SET optimize_move_to_prewhere = false;