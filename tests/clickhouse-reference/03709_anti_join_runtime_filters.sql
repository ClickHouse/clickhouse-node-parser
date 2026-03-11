-- LEFT ANTI JOIN
SELECT REGEXP_REPLACE(trimLeft(explain), '_runtime_filter_\\d+', '_runtime_filter_UNIQ_ID')
FROM (
    EXPLAIN actions=1
    SELECT count()
    FROM customer LEFT ANTI JOIN nation
    ON c_nationkey = n_nationkey
)
WHERE (explain ILIKE '%Filter column%') OR (explain LIKE '%BuildRuntimeFilter%') OR (explain LIKE '% Type:%') OR (explain LIKE '% Strictness:%');
SELECT count()
FROM customer LEFT ANTI JOIN nation
ON c_nationkey = n_nationkey
SETTINGS enable_join_runtime_filters = 0;
SELECT count()
FROM customer LEFT ANTI JOIN nation
ON c_nationkey = n_nationkey
SETTINGS enable_join_runtime_filters = 1;
-- RIGHT ANTI JOIN
SELECT REGEXP_REPLACE(trimLeft(explain), '_runtime_filter_\\d+', '_runtime_filter_UNIQ_ID')
FROM (
    EXPLAIN actions=1
    SELECT count()
    FROM customer RIGHT ANTI JOIN nation
    ON c_nationkey = n_nationkey
)
WHERE (explain ILIKE '%Filter column%') OR (explain LIKE '%BuildRuntimeFilter%') OR (explain LIKE '% Type:%') OR (explain LIKE '% Strictness:%');
