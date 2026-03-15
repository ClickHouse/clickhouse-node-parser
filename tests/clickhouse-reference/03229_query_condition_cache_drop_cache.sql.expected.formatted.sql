-- Tags: no-parallel, no-release
-- Tag no-parallel: Messes with internal cache
-- Tag release: Checks fields in system.query_condition_cache which are not available in release builds
-- Tests that SYSTEM CLEAR QUERY CONDITION CACHE works
SET allow_experimental_analyzer = 1;

CREATE TABLE tab
(
    a Int64,
    b Int64
)
ENGINE = MergeTree
ORDER BY a;

SELECT count(*)
FROM tab
WHERE b = 10000
SETTINGS use_query_condition_cache = true
FORMAT Null;

SELECT count(*)
FROM `system`.query_condition_cache;