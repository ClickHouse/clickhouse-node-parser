SELECT
    key,
    sum(agg)
FROM tbl
GROUP BY key
WITH TOTALS
ORDER BY key ASC
SETTINGS use_query_cache = 1;

SELECT count(*)
FROM `system`.query_cache;

SELECT '---';

SELECT
    key,
    sum(agg)
FROM tbl
GROUP BY key
ORDER BY key ASC
SETTINGS
    use_query_cache = 1,
    extremes = 1;

SELECT
    key,
    sum(agg)
FROM tbl
GROUP BY key
WITH TOTALS
ORDER BY key ASC
SETTINGS
    use_query_cache = 1,
    extremes = 1;