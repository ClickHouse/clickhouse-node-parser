-- Tags: no-parallel
-- Tag no-parallel: Messes with internal cache

-- Test for issue #84508 (incorrect results caused by query condition cache when used with IN functions on non-const sets)

SET allow_experimental_analyzer = 1;
SET use_query_condition_cache = 1;
CREATE TABLE tab1 (
    id UInt32 DEFAULT 0,
)
ENGINE = MergeTree()
ORDER BY tuple();
CREATE TABLE tab2 (
    filter_id UInt32 DEFAULT 0
)
ENGINE = MergeTree()
ORDER BY tuple();
-- Should return 1
SELECT count()
FROM tab1
WHERE id IN (
    SELECT filter_id
    FROM tab2
);
