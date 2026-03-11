SELECT '-- Check that filter on c_nationkey is moved to PREWHERE';
SELECT REGEXP_REPLACE(trimLeft(explain), '_runtime_filter_\\d+', '_runtime_filter_UNIQ_ID')
FROM
(
    SELECT *
    FROM viewExplain('EXPLAIN', 'actions = 1', (
        SELECT
            count(),
            max(c_custkey)
        FROM customer, nation
        WHERE (c_nationkey = n_nationkey) AND (n_name = 'FRANCE')
        SETTINGS enable_join_runtime_filters = 1, optimize_move_to_prewhere = 1, query_plan_join_swap_table = 0
    ))
)
WHERE (explain LIKE '%ReadFromMergeTree%') OR (explain LIKE '%Prewhere filter column:%') OR (explain LIKE '%Build%');
SELECT REGEXP_REPLACE(trimLeft(explain), '_runtime_filter_\\d+', '_runtime_filter_UNIQ_ID')
FROM
(
    SELECT *
    FROM viewExplain('EXPLAIN', 'actions = 1', (
        SELECT
            count(),
            max(c_custkey)
        FROM nation, customer
        WHERE (c_nationkey = n_nationkey) AND (n_name = 'FRANCE')
        SETTINGS enable_join_runtime_filters = 1, optimize_move_to_prewhere = 1, query_plan_join_swap_table = 1
    ))
)
WHERE (explain LIKE '%ReadFromMergeTree%') OR (explain LIKE '%Prewhere filter column:%') OR (explain LIKE '%Build%');
SELECT REGEXP_REPLACE(trimLeft(explain), '_runtime_filter_\\d+', '_runtime_filter_UNIQ_ID')
FROM
(
    EXPLAIN actions=1
    SELECT count() FROM nation, customer
    WHERE (c_nationkey = n_nationkey) AND (n_name = 'FRANCE') AND (c_custkey%4 = 0)
    SETTINGS enable_join_runtime_filters = 1, optimize_move_to_prewhere = 1, query_plan_join_swap_table = 1, enable_multiple_prewhere_read_steps = 1
)
WHERE (explain LIKE '%ReadFromMergeTree%') OR (explain LIKE '%Prewhere filter column:%') OR (explain LIKE '%Build%');
