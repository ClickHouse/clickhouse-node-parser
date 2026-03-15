-- Tags: no-parallel
-- Tag no-parallel: Messes with internal cache
-- Test for issue #81506 (recursive CTEs return wrong results if the query condition cache is on)
SET allow_experimental_analyzer = 1; -- needed by recursive CTEs

SELECT '-- Prepare data';

CREATE TABLE tab
(
    id String,
    parent String
)
ENGINE = MergeTree
ORDER BY tuple();