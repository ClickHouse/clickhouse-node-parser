SELECT countIf(like(`explain`, '%ScatterByPartitionTransform%'))
FROM (
        EXPLAIN PIPELINE
        SELECT
            a,
            b,
            ROW_NUMBER() OVER (PARTITION BY a ORDER BY b DESC) AS rn
        FROM t
        SETTINGS query_plan_reuse_storage_ordering_for_window_functions = 0
    );

SELECT countIf(like(`explain`, '%ScatterByPartitionTransform%'))
FROM (
        EXPLAIN PIPELINE
        SELECT
            a,
            b,
            ROW_NUMBER() OVER (PARTITION BY a ORDER BY b DESC) AS rn
        FROM t
        SETTINGS query_plan_reuse_storage_ordering_for_window_functions = 1
    );